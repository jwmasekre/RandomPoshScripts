# JIT-SS #
## Purpose ##

The intent of this script is to provide Just In Time Administration to smaller IT teams that cannot afford to spare an administrator to approve individual requests, or would prefer a more streamlined JIT experience.
> NOTE: this script is not ready out of the box, it will require some work to tailor to your environment.
## Requirements
- RSAT installed on each computer running the script
- Separate accounts for administration (ie: josh.masek and josh.masek.a)
- A group mirroring every administrative account you wish to limit membership to (ie: Domain Admins and Domain Admins-Elevatable)
- A service account whose role is exclusively to add members to groups
- A mailbox for sending the auditing emails to
- A file with stored credentials of the service account created by the user making the request
## Concept of Operations
JIT is governed by the idea that admin accounts only have the specific permissions they need at the specific time they need it. The following scenario is designed to emulate a potential use-case for this self-service implementation of JIT. 

User John Doe needs to decommission a Domain Controller, and therefore requires Domain Admin. He has already created the stored credentials file by piping `get-credential` to `out-file`. (Alternatively, while the user is signed in, have someone in a security role create the file for them, so they are not exposed to the credentials of the service account.) The user runs the script, and requests Domain Admins. The script checks whether or not John Doe has an administrator account (john.doe.a) and whether or not john.doe.a is a member of Domain Admins Elevatable.

If he meets both requirements, he then indicates how long he needs Domain Admins membership for. Then, using the credentials for the service account, the script adds him to the Domain Admins group using the `-membertimetolive` to automatically remove membership at the end of the time limit.

An email is then sent to the auditing mailbox. The intent of this is to simultaneously have notifications delivered when group memberships change; if a user uses the script, two notifications should exist. If the service account is misused (used to change group membership without using the script), only one notification will be present, indicating abuse or compromise and likely necessitating a change of password.

Again, this script is designed for small IT departments that may not be able to 