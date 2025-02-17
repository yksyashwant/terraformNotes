## NACL vs Security Group

- **NACLs (Network Access Control Lists)** operate at the **subnet** level and control traffic in and out of a VPC.
- **Security Groups** operate at the **instance** level and control traffic to and from individual EC2 instances.
- NACLs apply to **all instances** in a subnet, while Security Groups apply to **individual instances**.
- NACLs have a **default rule** that denies all traffic, while Security Groups have a **default rule** that allows all traffic.

## SAML IAM in AWS

Security Assertion Markup Language (SAML) is a standard protocol used for securely exchanging authentication and authorization data between organizations. SAML allows you to use your existing **identity provider (IdP)** to authenticate users and grant them access to AWS resources.

Using **SAML** with AWS IAM enables you to use your existing identity provider to authenticate users and manage their access to AWS resources. This is particularly useful when you have a large number of users who need access, as it allows you to manage their access **centrally**.

## Steps to Build a Custom VPC

1. Create a VPC.
2. Create subnets.
3. Create an **Internet Gateway (IGW)**.
4. Attach the new IGW to your VPC.
5. Create a new **Route Table (RT)**.
6. Add the IGW as a route to the new RT.
7. Add a subnet to the RT's subnet associations (this will be the **public-facing subnet**).
8. Create a **webserver** (public subnet) and **database server** (private subnet) instances.
9. Create a new **security group** for the NAT instance.
10. Add **HTTP** and **HTTPS** inbound rules that allow traffic from the private subnet's IP.
11. Create a **NAT instance** (in the public subnet).
    - Choose the first image.
    - Disable **auto-assign public IP**.
    - Add it to the **NAT security group**.
12. Create an **Elastic IP**.
13. Associate the Elastic IP to the NAT.
14. Disable **source/destination checks** for the NAT.
15. Add the NAT instance as a route to the initial VPC route table.

## What is the Difference Between Stateful and Stateless Filtering?

- **Stateful Filtering**: Tracks the origin of a request and can automatically allow the reply to the request to be returned to the originating computer.
- **Stateless Filtering**: Only examines the source or destination IP address and the destination port, ignoring whether the traffic is a new request or a reply to a request.
