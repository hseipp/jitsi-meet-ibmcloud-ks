<!-- This should be the location of the title of the repository, normally the short name -->
# jitsi-meet-ibmcloud-ks

<!-- Build Status, is a great thing to have at the top of your repository, it shows that you take your CI/CD as first class citizens -->
<!-- [![Build Status](https://travis-ci.org/jjasghar/ibm-cloud-cli.svg?branch=master)](https://travis-ci.org/jjasghar/ibm-cloud-cli) -->

<!-- Not always needed, but a scope helps the user understand in a short sentance like below, why this repo exists -->
## Scope

The purpose of this project is to provide an example IBM Cloud Kubernetes Service use case that might be helpful for some during the pandemic.
It provides a script that creates a free IBM Cloud Kubernetes Service cluster and installs a [Jitsi Meet](https://jitsi.org/)
containerized instance on top of it.

Please note that with the free IBM Cloud Kubernetes cluster you can't get a nice URL route for your application nor integrate certificate signing using "Let's Encrypt". "Let's Encrypt" requires the Jitsi Web server being accessible through port 80 or 443. To enable both functionalities, Ingress is required. Ingress is only available for IBM Cloud Kubernetes Standard clusters.

So far only small conferences (1-3 participants) have been tested on the free IBM Cloud Kubernetes cluster. I'd expect issues with a large number of participants due to the limited worker node resources (2 vCPU, 4GB RAM) of the free service.

## Prerequisites

Before running the script you need

* An IBM Cloud Account - register for a free one [here](https://cloud.ibm.com).
* The IBM Cloud CLI set up as described [here](https://cloud.ibm.com/docs/cli). The `kubectl` and `git` tools required by this script are installed with the IBM Cloud CLI.
* The `jq` JSON parser program

<!-- A more detailed Usage or detailed explaination of the repository here -->
## Usage

Edit the [script](src/jitsi-iks-install.sh) to set the variables on top according to your needs.
Then navigate to a directory where the Jitsi Kubernetes deployment can be installed to.
Start `jitsi-iks-install.sh` and enter your IBM Cloud credentials, then just wait a couple of minutes for the
Kubernetes cluster getting created and the Jitsi Meet instance getting deployed.

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

This project was only possible thanks to [Jitsi Meet](https://jitsi.org/) and [its Containerized variant](https://github.com/jitsi/docker-jitsi-meet) Open Source projects.

## License

If you would like to see the detailed LICENSE click [here](LICENSE).
