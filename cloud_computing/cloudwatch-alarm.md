1. Open CloudWatch in AWS Console
    - On the left menu, click Alarms → Create Alarm.
   ![alarms tab](../Pictures/aws-cw-alarms.png)
   ![create alarms](../Pictures/aws-create-alarm.png)
2. click select metric 
  ![select metric](../Pictures/aws-select-alarm-metric.png)
3. Select EC2.  
  ![select ec2 metric](../Pictures/aws-ec2-select-metric.png)
    - In the search bar, type your EC2 instance ID 
   ![per instance metrics](../Pictures/aws-per-instance-metrics.png)
    - select cpu utilisation metric- monitors as a % and select metric in bottom right hand corner.
    !![alt text](../Pictures/aws-cpu-utilisation.png)
4. Step 3: Set Up Conditions
   - In the conditions section make sure:
        - Threshold type: "Static".
        - configure threshold for metric e.g., cpu>80% 
     ![metric conditions](../Pictures/aws-metric-conditons.png)
5. Configure Actions (notifications)
   - Under Notification, click Create a new SNS topic.
   - Enter a name for the topic.
   - Enter email address to send the notification to & confirm via link
  ![alarm sns](../Pictures/aws-alarm-sns-topic.png)
6. Give the alarm a name and description
   ![alarm name](../Pictures/aws-alarm-name.png)
7. Create alarm
   ![alt text](../Pictures/aws-finish-creating-alarm.png)
