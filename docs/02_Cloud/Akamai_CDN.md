AKAMAI — GLOBAL EDGE NETWORK (CDN)

WHAT IS AKAMAI?

Akamai is a global company that operates one of the largest distributed edge networks.
It provides CDN (Content Delivery Network), WAF, DDoS protection, and security services.

Your app stays in Azure. You rent Akamai's global edge servers so:
1. User requests first hit the nearest Akamai edge server.
2. Akamai checks cache, security (WAF, DDoS filter).
3. If needed, Akamai forwards the request to your Azure origin server.
4. Azure processes it and sends the response back to Akamai.
5. Akamai delivers it to the user.

Flow: User → Nearest Akamai Edge → Azure Origin Server → Akamai Edge → User

WHY BIG COMPANIES USE AKAMAI

1. Global Speed (Latency Reduction)
   - Azure has ~60 regions. Akamai has 1000s of edge servers in 130+ countries.
   - Users hit the nearest Akamai node = faster response.
   - Netflix, Disney+, Hotstar use Akamai for streaming.

2. Massive Security Shield
   - Blocks: DDoS attacks, bot attacks, SQL injection, API abuse, credential stuffing.
   - Banks and airlines cannot afford downtime or origin exposure.

3. Traffic Offloading (Cost + Performance)
   - Akamai serves 80-95% of traffic from cache.
   - Your Azure server only handles dynamic/personalized requests.
   - Reduces Azure compute cost and bandwidth.

4. Reliability During Traffic Spikes
   - Black Friday, ticket sales, sports events = 100x traffic spikes.
   - Akamai's global edge absorbs the spike. Azure alone cannot.

5. Physically Closer to Users
   - Akamai > Azure/AWS/GCP in terms of edge proximity to end users.

AKAMAI vs COMPETITORS

Company            | Analogy          | Strength
-------------------|------------------|----------------------------------
Akamai             | DHL              | Largest global network, enterprise
Cloudflare         | FedEx            | Fast, modern, developer-friendly
AWS CloudFront     | Amazon Logistics | Best if already on AWS
Azure Front Door   | BlueDart         | Best if Azure-centric
Fastly             | Uber Eats        | Super fast, real-time, dev-focused
Imperva            | Bank vault        | Strong WAF and security

Akamai is cloud-agnostic — works with Azure, AWS, GCP, on-prem, hybrid.

ORIGIN STORY

Akamai was founded in 1998 at MIT.
Tim Berners-Lee (inventor of the Web) gave MIT a challenge: "Fix internet congestion."
MIT professors Tom Leighton and Danny Lewin invented the CDN concept and founded Akamai.
They literally invented modern content delivery networks.

ONE-LINE SUMMARY

Akamai is a global edge network that sits in front of your cloud server,
making your app faster, safer, and more reliable for users worldwide.
