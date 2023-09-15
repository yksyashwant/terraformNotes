NACL vs Security Group

NACLs operate at the subnet level and control traffic in and out of a VPC, 
while Security Groups operate at the instance level and control traffic to and from individual EC2 instances. 
NACLs apply to all instances in a subnet, while Security Groups apply to individual instances. 
NACLs have a default rule that denies all traffic, while Security Groups have a default rule that allows all traffic.  


SAML IAM in AWS
Security Assertion Markup Language (SAML) is a standard protocol used for securely exchanging authentication and authorization data between organizations. 
SAML allows you to use your existing identity provider (IdP) to authenticate users and grant them access to AWS resources.

Using SAML with AWS IAM allows you to use your existing identity provider to authenticate users and grant them access to AWS resources. 
This can be especially useful if you have a large number of users who need access to AWS resources, as it allows you to manage their access centrally. 

 what are the steps to build a custom vpc?

 1. create a vpc
2. create subnets
3. create an internet gateway (igw)
4. attach the new igw to your vpc
5. create a new route table (rt)
6. add the igw as a route to the new rt
7. add a subnet to the rts subnet associations (this will be the public-facing subnet)
8. create webserver (public subnet) and database server (private subnet) instances
9. create a new security group for the nat instance
10. add http and https inbound rules that allow traffic from the private subnets ip
11. create a nat instance (public subnet)
community amis
choose the first image
diable auto-assign public ip
add it to the nat security group
12. create an elastic ip
12. associate the elastic ip to the nat
13. disable source/destination checks for the nat
14. add the nat instance as a route to the initial vpc rt

what is the difference between stateful and stateless filtering?

stateful filtering tracks the origin of a request and can automatically allow the reply to the request to be returned to the originating computer.
stateless filtering, only examines the source or destination ip address and the destination port, ignoring whether the traffic is a new request or a reply to a request.
