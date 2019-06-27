###  DevOps Enterprise Summit London
#### DD-MM-YYYY

<intro>
I've spent the past 3 days at the [DevOps Enterprise Summit London](https://events.itrevolution.com/) listening to some fasinating talks, sharing stories and experiences with other attendees and meeting a variety of vendors who have products in the DevOps space. I also took full advanatge of the swag on offer, including picking up a pair of StackOverflow socks!<br> ADD INSTAGRAM POST HERE.<br> We were also lucky enough to be given a pre-release copy of Gene Kim's next book, [The Unicorn Project](https://www.amazon.co.uk/dp/1942788762/ref=cm_sw_em_r_mt_dp_U_SHnfDbC56EEVM, which is a follow up to the brilliant [The Pheonix Project](https://www.amazon.co.uk/dp/1942788290/ref=cm_sw_em_r_mt_dp_U_9JnfDbZBRGA74).
</intro>

<p>
As the presenations went on I noted down key themes and information into a note on my phone which I've tidied up below. These themes won't really be a surprise to anyone with knowledge of DevOps. For me, the real benefit of a conferance like this hearing the war stories and scars picked up along the way from people who have carried out DevOps transformations within their organisations and come out the other end. Hopefully by taking these onboard we can avoid making the same mistakes.
</p>
<p>
So here are my, partially, tidied up notes. I've tried to group theme into key themes but I'm sure some items would fit into multiple sections:
</p>
<p>

**Culture**

- Commonality is key. Common tooling, practices, language, culture are required so all stakeholders are on the same page.
- Measurements to grow against are essential. You can't tell if you're improving unless you have a baseline to measure against.
- Build Communities within your organisation. Promote knowledge sharing.

**Leadership**

- There needs to be a strong partnership between business and technology leads. 
- Vision / strategy essential.
- Decide what not to do - e.g. whatever can be commoditised and outsourced do it (e.g. use of public cloud). Enable focus on your real value streams.
- Communicate frequently (bi-weekly town halls, etc).
- Rally around main thing (e.g key metrics you work against). Everyone should know where we stand at any given time.
- Understand the risk of status quo.
- On average 2/3s of your workforce will be resistant to change. Work with those excited by the change and build a swell that takes the rest of the workforce on the journey.
- Don’t hide costs. Make them available to the roles that need them.


**Transformation**

- Clear outcomes essential. What is done? It needs to be a measurable **business** result.
- Transformation is risky. If used correctly DevOps and the Cloud can significantly reduce these risk.
- Control risk by smaller releases.
- Ensure capital applied to right initiatives by early prototypes.
- No more projects. Consider all change to be product enhancements. 
- Copy questions not answers from other organisations e.g. the Spotify model is their answer, you need to find your answer to the same question.
- Top level / C-Lvel support is essential for any transformation. 
- Tackle impediments before they become blockers.
- Don’t boil the ocean all at once. 

**Platforms**

- Platforms shoudl be self service wherever feasible. This will reduce lead times, reduce hand offs. Self service needs to consider all users, not just technical. For example the business will be interested in platform costs, make these easily visible.
- On demand is essential.
- Elasticity is essentail.
- Transparent and measurable.
- Use and contribute to open source.
- Inner source (allow internal members to contribute to the platform, not just the platform management team).
- Use all avaliable data to measure and tcontinusly improve.

**Integrate**

- Allow members to use the tools they are comfortable with. Integrate tools together e.g. integrate helpdesk ticketing system into slack so an engineer can apply updates without leaving Slack channel.

**Product Ownership**

- Have a road map.
- Always demonstrate how a feature adds business value.
- Lead times need to include complete end to end process - for example, from recieving a feature request to delivering it into the production environment. It doesn’t matter how many deployments a day you can manage if your lead times are too long the world will have changed before you deliver.

**Use Guardrails**

- (Guardrails)[https://blog.sonatype.com/less-gates-more-guardrails-devsecops-lessons-learned-in-2017] are guidance for all teams to follow. They should given the team enough room to decide upon their prefered approach while also ensuring any standard requirements, e.g. security requirements, are met.
- Examples of guardrails may be data must be encrypted at rest, or a pipeline must be used for software builds and deployment, or no human  will ever login to a production server. 

**Security**

- visualise stats from sonarqube / sonartype it will instantly provoke a culture of trying to improve the metrics 

**Service**

- The classic tiered support model is no longer fit for purpose, need to embrace swarming. 
- Swarming improves sharing of knowledge amongst the team, prevents a single point of failure and member burn out. 
- A move to swarming will require new measurements and is likely to break current contractual measurements. 
- ITIL4 will embrace swarming when released/
- Automate, automate, automate - for example when an incident is raised, automate the creation of slack channel with appropriate then resources to debug. Once the resolved automated the setting up of lessons learnt session. Automate adding and item to the product backlog if software bugs have been identified.

**Change Management**

- Change awareness remains key in a DevOps world.
- Utilise technology to plugin to change process, e.g. auto generate build notes, change req templates, etc.
- Tools such as (Cloudbees Flow)[https://electric-cloud.com/products/electricflow/] can automate large parts of currently manual processes and provide increased control and visibility to stakeholders.

</P>