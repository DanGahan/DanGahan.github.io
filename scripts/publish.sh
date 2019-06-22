#!/bin/bash

#throw error if no draft supplied as input
if [ $# -eq 0 ]
  then
    echo "Error: No arguments supplied, provide the draft you want to publish"
    exit 1
fi

#Set the draft to publish as input var
input="$1"
filename=`basename $input`

#check if pandoc installed to convert file
if ! [ -x "$(command -v pandoc)" ]; then
  echo 'Error: pandoc is not installed.' >&2
  exit 1
fi

#Create tmp copy of the md file to work against
cp $input ../tmp/

#replace DD-MM-YYYY in file with actual published date
sed -i "" "s|DD-MM-YYYY|$(date '+%d/%m/%Y')|g" ../tmp/$filename

#Set post HTML file name
title=`head -n 1 ../tmp/$filename | tr -dc '[:alnum:]\n\r' | tr -s " "`
dirname=$title$(date '+%d%m%Y')

#Create directory for post in posts dir
mkdir ../posts/$dirname

#Copy index.html page into post directory
cp ../index.html ../posts/$dirname/$title.html

#Convert file from md to html
pandoc -f markdown ../tmp/$filename > ../posts/$dirname/content.html

#clear down tmp dir
rm ../tmp/*

#Add intro from post to top of home page and accompanying link to read whole post

    #Extract and past title into post.tmp
    echo "<post>" > ../tmp/post.tmp
    echo "<h3>" >>  ../tmp/post.tmp
    sed -n 's:.*>\(.*\)</h3>.*:\1:p' ../posts/$dirname/content.html >>  ../tmp/post.tmp
    echo "</h3>" >>  ../tmp/post.tmp
    #Extract and paste the date from post.tmp
    echo "<h4>" >>  ../tmp/post.tmp
    sed -n 's:.*>\(.*\)</h4>.*:\1:p' ../posts/$dirname/content.html >>  ../tmp/post.tmp
    echo "</h4>" >>  ../tmp/post.tmp
    #Extract text between intro tags and paste tmp file, second sed trimes any white space at start of intro
    echo "<p>" >>  ../tmp/post.tmp
    sed -n 's:.*<intro>\(.*\)</intro>.*:\1:p' ../posts/$dirname/content.html | sed -e 's/^[[:space:]]*//' >> ../tmp/post.tmp
    echo "<br>">>  ../tmp/post.tmp
    #Insert Hyperlink to Continue Rreading the Post
    echo '<a href="/posts/'$dirname'/'$title'.html">Continue Reading</a>' >>  ../tmp/post.tmp
    echo "<br>">>  ../tmp/post.tmp
    #Insert HR 
    echo "<hr>" >>  ../tmp/post.tmp
    echo "<br>">>  ../tmp/post.tmp
    echo "</post>" >> ../tmp/post.tmp

    #Copy homepage content.html to /tmp dir
    cp ../content.html ../tmp/
    #Add new Post to the top of tmp content.html
    cat ../tmp/post.tmp | cat - ../tmp/content.html > ../tmp/temp && mv ../tmp/temp ../tmp/content.html
    #Crop any posts other than top 5 in file, really crude approach but each post is 15 lines so we cut everything after line 75
    sed -i '' '76,$d' ../tmp/content.html

    #Add link to homepage content.html for the posthistory page if its not already present
    finalline=`tail -n 1 ../content.html`
    string='<p><a href="./posthistory.html">Older Posts</a></p>'
    if [ "$finalline" != "$string" ]; then
        echo '<p><a href="./posthistory.html">Older Posts</a></p>' >>  ../tmp/content.html
    fi
    
    #Copy tmp content.html back to homepage content.html
    cp ../tmp/content.html ../content.html

    #Add Post to posthistory.html
    date=`sed -n 's:.*>\(.*\)</h4>.*:\1:p' ../posts/$dirname/content.html`
    link=`echo '<a href="/posts/'$dirname'/'$title'.html">Read</a>'`
    echo "<p>" "&#8226; &nbsp" $title "&nbsp" $date "&nbsp" $link "</p>" >> ../posthistorycontent.html
    echo "<br>" >> ../posthistorycontent.html

#Add entry to RSS feed for post

    #Copy rss.xml to tmp dir
    cp ../rss.xml ../tmp
    #Store first 6 lines of rss.sml in tmp file
    head -n 6 ../tmp/rss.xml > ../tmp/rsshead.tmp
    #Remove First 6 lines of rss.xml
    sed -i "" '1,6d'  ../tmp/rss.xml
    #Copy tmp rss.xml to rssbottom.tmp
    cp ../tmp/rss.xml ../tmp/rssbottom.tmp
    #Create new item
    echo "<item>" >> ../tmp/rssnewitem.tmp
    echo "<title>" >> ../tmp/rssnewitem.tmp
    sed -n 3p ../tmp/content.html >> ../tmp/rssnewitem.tmp
    echo "</title>" >> ../tmp/rssnewitem.tmp
    echo "<guid>https://gahan.me.uk/posts/$dirname/$title.html</guid>" >> ../tmp/rssnewitem.tmp 
    echo "<description>" >> ../tmp/rssnewitem.tmp
    echo "<![CDATA[" >> ../tmp/rssnewitem.tmp
    sed -n 's:.*<intro>\(.*\)</intro>.*:\1:p' ../posts/CardiffCityFixtures2019202022062019/content.html | sed -e 's/^[[:space:]]*//'  >> ../tmp/rssnewitem.tmp
    echo '<a href="https://gahan.me.uk/posts/'$dirname'/'$title'.html">Continue Reading</a>' >> ../tmp/rssnewitem.tmp
    echo "]]>" >> ../tmp/rssnewitem.tmp
    echo "</description>" >> ../tmp/rssnewitem.tmp
    echo "</item> " >> ../tmp/rssnewitem.tmp
    #Reconstruct XML file
    cat ../tmp/rsshead.tmp > ../tmp/rss.xml
    cat ../tmp/rssnewitem.tmp >> ../tmp/rss.xml
    cat ../tmp/rssbottom.tmp >> ../tmp/rss.xml
    #Move new XML file back into root dir
    cp -f ../tmp/rss.xml ../rss.xml