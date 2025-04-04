1. Open CloudWatch in AWS Console
    - On the left menu, click Alarms → Create Alarm.


![alt text](../Pictures/Cloudwatch-alarm/aws-cw-alarms.png)


![alt text](../Pictures/Cloudwatch-alarm/aws-create-alarm.png)





2. click select metric 



  ![alt text](../Pictures/Cloudwatch-alarm/aws-select-alarm-metric.png)




3. Select EC2.  


  ![alt text](../Pictures/Cloudwatch-alarm/aws-ec2-select-metric.png)


    - In the search bar, type your EC2 instance ID 



   ![alt text](../Pictures/Cloudwatch-alarm/aws-per-instance-metrics.png)



    - select cpu utilisation metric- monitors as a % and select metric in bottom right hand corner.




    ![alt text](../Pictures/Cloudwatch-alarm/aws-cpu-utilisation.png)



4. Set Up Conditions
   - In the conditions section make sure:
        - Threshold type: "Static".
        - configure threshold for metric e.g., cpu>80% 



     ![alt text](../Pictures/Cloudwatch-alarm/aws-metric-conditons.png)




5. Configure Actions (notifications)
   - Under Notification, click Create a new SNS topic.
   - Enter a name for the topic.
   - Enter email address to send the notification to & confirm via link




  ![alt text](../Pictures/Cloudwatch-alarm/aws-alarm-sns-topic.png)





6. Give the alarm a name and description



   ![alt text](../Pictures/Cloudwatch-alarm/aws-alarm-name.png)




7. Create alarm

   ![alt text](../Pictures/Cloudwatch-alarm/aws-finish-creating-alarm.png)
