# Tungsten-Fabric Demo Deployment

Sample files for deploying tungsten-fabric on a Kubernetes environment. These were used for the demo that can be seen here: https://www.youtube.com/watch?v=b76Qhuu8S2U 

## Getting Started

These sample manifests were used to create the single master environment used in the demo linked above. Note that the IPs to the nodes must be changed in order to reference your own nodes and gateway. The variables to change are named `K8S_MASTER_IP` and range from 1 to multiple depending on the deployment.

### Environment

These specific manifests were tested using the following environment: 
* CentOS: 7.5.1804
* Kernel: 3.10.0-957
* Docker: 1.13.1
* Kubernetes: 1.10.5

To use the latest manifests, see the installation docs here: https://tungstenfabric.github.io/website/Tungsten-Fabric-Centos-one-line-install-on-k8s.html 

**Be sure to change the VROUTER_GATEWAY to your ACTUAL gateway IP. Otherwise, the node will be inaccessible when the vrouter interface is started**

Link to the raw manifest can be found here: https://raw.githubusercontent.com/Juniper/contrail-kubernetes-docs/master/install/kubernetes/templates/contrail-single-step-cni-install-centos.yaml with special regard to: 
* Ensure `mkdir -pm 777 /var/lib/contrail/kafka-logs` is ran against the node(s)
* {{ CONTRAIL_REPO }}: by default, it will reference `docker.io/opencontrailnightly`
* {{ CONTRAIL_RELEASE }}: by default, it will reference `latest`
* {{ K8S_MASTER_IP }}: no default value, must provide IPs of the nodes. Note the caveat around the VROUTER_GATEWAY

### File List

* **busybox-tf-deploy.yaml**: A busybox deployment to test network-based isolation 
* **cleanup.sh**: This script can be run to cleanup the nodes and have them ready for another deployment. It is important to run through these steps so that the deployment comes up healthy
* **contrail.yaml**: The deployment file for tungsten-fabric against a single master node. The configmap can always be edited later on to get the deployment working for more master nodes
* **contrail_2masters.yml** and **contrail_HA.yml**: Attempts at created an HA deployment. These were unsuccessful

## References

* Tungsten Fabric Architecture: https://tungstenfabric.github.io/website/Tungsten-Fabric-Architecture.html
* Tungsten Fabric Overview and Intel Contributions: https://events19.linuxfoundation.org/wp-content/uploads/2018/08/Intel-YiYang-Tungsten-Fabric-Overview-and-Intel-Contributions.pdf
* Tungsten Fabric Primer by tnaganawa: https://github.com/tnaganawa/tungstenfabric-docs/blob/master/TungstenFabricPrimer.md
* CloudOps TF Demo: https://github.com/cloudops/tf-demo
Tungsten Fabric Docs/Event Decks: https://wiki.tungsten.io/display/TUN/Event+Decks