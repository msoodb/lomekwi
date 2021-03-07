#!/bin/bash

"""
https://blog.jwf.io/2017/11/first-rpm-package-fedora/
http://lackof.org/taggart/hacking/FOSS-build/
https://fedoraproject.org/wiki/How_to_create_a_GNU_Hello_RPM_package
https://fedoraproject.org/wiki/Join_the_package_collection_maintainers
https://bugzilla.redhat.com
https://admin.fedoraproject.org/accounts
https://lists.fedoraproject.org/admin/lists/devel-announce@lists.fedoraproject.org/
https://lists.fedoraproject.org/admin/lists/devel@lists.fedoraproject.org/
https://copr.fedorainfracloud.org
https://developer.fedoraproject.org/deployment/copr/copr-cli.html
"""

""" Development Environment """
sudo dnf install fedora-packager @development-tools
sudo usermod -a -G mock $USER && su - $USER
sudo dnf install copr-cli
> Create a Bugzilla Account "msoodb"
> Create a Fedora Account "msoodb"
> Join the important Mailing Lists "devel@lists.fedoraproject.org", "devel-announce@lists.fedoraproject.org"
> Introduce yourself
> Configure Your Git
> Get API token at the Copr API Page
echo copr-api-token > ~/.config/copr
echo "msoodb" > ~/.fedora.upn
~/rpmdev-setuptree


""" Kerberos Ticket """
kinit msoodb@FEDORAPROJECT.ORG

""" Adding a new package """
""" 
    Development Environment
    Make a Package
    Upload Your Package
    Create Your Review Request
    Inform Upstream
    Watch for Feedback
    Get Sponsored
    Add Package to Source Code Management (SCM) system and Set Owner
    Check out the module
    Test Your Package
    Import, commit, and build your package
    Update Your Branches (if desired)
    Submit Package as Update in Bodhi
"""
