1. Go to the AWS Management Console and navigate to EC2 service and find launch templates on the side.
   
![alt text](../../Pictures/Launch-template/LT-AMC.png)



1. Click on Create Launch Template.

![alt text](../../Pictures/Launch-template/lt-create.png)


3. Define Basic Information
   - Launch Template Name – Enter a descriptive name for your template.

   - Template Version Description (Optional) – Provide a description for clarity.

![alt text](../../Pictures/Launch-template/LT-name-des.png)

4. Choose an AMI (Amazon Machine Image)


![alt text](../../Pictures/Launch-template/lt-choose-ami.png)



5. Configure Key Pair (For SSH Access) and Configure Security Group

![alt text](../../Pictures/Create-Dashboard/aws-keypair-securitygroup.png)



6. Add a Resource Tag to name EC2 instance

![alt text](../../Pictures/Launch-template/lt-resource-tag.png)




![alt text](../../Pictures/Launch-template/lt-resource-tag-name.png)






7. Go into Additional settings tab and configure user data for your instance.


![alt text](../../Pictures/Launch-template/lt-user-data.png)





8. Create launch template 


![alt text](../../Pictures/Launch-template/lt-create-finish.png)



9. Find launch template in Launch templates section and click actions and launch instance from the template.

![alt text](../../Pictures/Launch-template/lt-find-action.png)


![alt text](../../Pictures/Launch-template/launch-instance-from-lt.png)

