<!-- This should be the location of the title of the repository, normally the short name -->
# jitsi-meet-ibmcloud-ks

<!-- Build Status, is a great thing to have at the top of your repository, it shows that you take your CI/CD as first class citizens -->
<!-- [![Build Status](https://travis-ci.org/jjasghar/ibm-cloud-cli.svg?branch=master)](https://travis-ci.org/jjasghar/ibm-cloud-cli) -->

<!-- Not always needed, but a scope helps the user understand in a short sentance like below, why this repo exists -->
## Scope

The purpose of this project is to provide an example IBM Cloud Kubernetes Service use case.
It provides a script that creates a free instance of IBM Cloud Kubernetes Service and installs a [Jitsi Meet](https://jitsi.org/)
containerized instance on the Kubernetes cluster.

## Prerequisites

Before running the script you need

* An IBM Cloud Account - register for a free one [here](https://cloud.ibm.com).
* The IBM Cloud CLI set up as described [here](https://cloud.ibm.com/docs/cli).
* A Bash shell with the following applications installed:
  * git

<!-- A more detailed Usage or detailed explaination of the repository here -->
## Usage

Edit the [script](src/jitsi-iks-install.sh) to set the variables on top according to your needs.
Then navigate to a directory where the Jitsi Kubernetes deployment can be installed to.
Start `jitsi-iks-install.sh` and enter your IBM Cloud credentials, then just wait a couple of minutes for the
Kubernetes cluster getting created and the Jitsi Meet instance getting deployed.

This repository contains some example best practices for open source repositories:

<!-- A notes section is useful for anything that isn't covered in the Usage or Scope. Like what we have below. -->
## Notes

There are dependencies on the versions of the IBM Cloud CLI and the docker-jitsi-meet project as of November 2020.
Changes to either of them might require adoption of the script.

<!-- Questions can be useful but optional, this gives you a place to say, "This is how to contact this project maintainers or create PRs -->
If you have any questions or issues you can create a new [issue here](https://github.com/hseipp/jitsi-meet-ibmcloud-ks/issues).

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

This project was only possible thanks to [Jitsi Meet](https://jitsi.org/) and [its Containerized variant](https://github.com/jitsi/docker-jitsi-meet) as Open Source projects.

## License

If you would like to see the detailed LICENSE click [here](LICENSE).
