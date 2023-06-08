# Amazon Connect Contact Lens Rules Library

Many businesses today use [Amazon Connect Rules](https://docs.aws.amazon.com/connect/latest/adminguide/connect-rules.html), a feature of [Contact Lens for Amazon Connect](https://aws.amazon.com/connect/contact-lens/), through Amazon Connect console for creating and managing rules. Though it’s easy to enable the feature, customers require guidance to build the amazon connect contact lens rules. They have challenges in realizing the value of the feature and need a set of rule templates as guidance for experimenting with their business use case similar to the sample set of contact flows out of the box.

With Amazon Connect Rules, contact center managers, supervisors, and quality analysts can automatically categorize contacts, send email notifications or dashboard alerts about customer escalations, prompt tips in agent desktop, and assign tasks for different roles in a contact center. These actions are automated based on conditions that businesses can define such as keywords used on a contact, sentiment trend of a contact, frequent interruptions by agent, agents being silent for long-periods, filtering specific contact attributes or queues, and many more. Rules also provides third-party integrations with leading CRM vendors such as Salesforce and Zendesk that allows you to trigger a task whenever a new case or ticket is created in Salesforce’s CRM or Zendesk’s ticket management system. You can automatically assign these tasks to agents or supervisors based on the case or ticket created and alert them to take necessary action. 

# Contact Lens

Contact Lens for Amazon Connect, a feature of [Amazon Connect](https://aws.amazon.com/connect/), provides a set of conversational analytics and quality management capabilities, powered by machine learning, that helps understand and classify the sentiment, trends, and compliance of your conversations. These contact center analytics can be used to take action, addressing customer issues, improving agent performance, and identifying crucial company and product feedback. You can more easily search call and chat transcripts, analyze sentiment, identify issues, and monitor agent performance in real-time. Contact Lens also helps you define and assess agent performance criteria (such as adherence to required scripts) and automatically complete evaluation forms. This reduces the need for managers to do manual reviews while more easily identifying coaching needs for your agents.

To learn more about Amazon Connect Contact Lens and its capabilities, please check out
the [Amazon Connect Admin Guide](https://docs.aws.amazon.com/connect/latest/adminguide/contact-lens.html).


## Prerequisites:

You should have the following prerequisites:

- An [AWS account](https://portal.aws.amazon.com/billing/signup/resume&client_id=signup) with both management console and programmatic administrator access
- An existing [Amazon Connect](http://aws.amazon.com/connect) instance with Contact Lens enabled and configured within an appropriate contact flow
- Upgrade AWS CLI with the latest version from this [link](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) based on the Operating System that you are using.

## Getting Started

## Downloading Contact Lens Rules Library from Github
Download the Contact Rules library from GitHub. You can do that by cloning our public repository here:

```
$ git clone https://github.com/aws-samples/amazon-connect-contact-lens-rules-library
```

Once you download the files, navigate to the directory where you have downloaded the json files.

## Creating Contact Lens Rules using AWS CLI
- Replace "YOUR_INSTANCE_ID" with your unique Amazon Connect Instance ID.  This can be found by navigating to your Amazon Connect console at https://console.aws.amazon.com/connect/, opening the instance page, and choosing your instance alias.  The information after **instance/** is your instance ID.
- Replace [FOLDER]/[RULE] with the file name of the Contact Lens rule you intend to upload.

```
$ aws connect create-rule --instance-id "YOUR_INSTANCE_ID" --cli-input-json file://[FOLDER]/[RULE].json
```
-  As an example if you wanted to deploy the Apology rule you would end up with the following command from the root directory of the repository:
```
$ aws connect create-rule --instance-id abcdefgh-ijkl-mnop-qrst-uvwxyz123456 --cli-input-json file://General/Apology/create-apology-voice-postcall.json
```
## Creating Contact Lens Rules using AWS CloudShell Script
- Download the [Install-CLRuleLibrary.ps1](https://github.com/aws-samples/amazon-connect-contact-lens-rules-library/blob/main/Install-CLRuleLibrary/Install-CLRuleLibrary.ps1) file from the repository
- Open CloudShell in the same region as your Amazon Connect instance.
- Upload the [Install-CLRuleLibrary.ps1](https://github.com/aws-samples/amazon-connect-contact-lens-rules-library/blob/main/Install-CLRuleLibrary/Install-CLRuleLibrary.ps1) script to CloudShell. See [Upload a file to CloudShell](https://docs.aws.amazon.com/cloudshell/latest/userguide/getting-started.html#folder-upload) for additional details.
- In CloudShell, type in `pwsh` and press enter to Launch PowerShell
- Set your instance ID as a variable in PowerShell:  
        ``` $instanceId = 'ENTER_YOUR_INSTANCE_ID'    ```

    See [Find your Amazon Connect instance ID/ARN](https://docs.aws.amazon.com/connect/latest/adminguide/find-instance-arn.html) for additional details.
- Run the Script: 

    ```    ./Install-CLRuleLibrary.ps1 -InstanceId $instanceId  ```
- Look at the rules page on Amazon Connect.  The script creates all post-call and real-time rules.

Sample of the script run in the AWS CloudShell:

![Sample of the script run in the AWS CloudShell](https://github.com/aws-samples/amazon-connect-contact-lens-rules-library/blob/main/Install-CLRuleLibrary/AWSCloudShellSnapshot.png)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

