Vim�UnDo� b+�KAJT؁-��l`�3�5"
VO?n�r2���T                                      O�\�   
 _�                             ����                                                                                                                                                                                                                                                                                                                                                             O�M�     �                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             O�M�     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�N     �               require 'fixuture/smaple5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�N     �               require 'fixuture/sample5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�N     �                 test "truth" do5�_�                       4    ����                                                                                                                                                                                                                                                                                                                                                             O�N8     �               4  test "sample name has nane and mail atrributes" do5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�Nb     �      	   
          sample.name = 'User'5�_�      	              	        ����                                                                                                                                                                                                                                                                                                                            	          	          V       O�N�     �      	          #    assert_kind_of Module, MailForm5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                            	          	          V       O�N�     �         
    5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  v       O�N�     �             �         
          sample = SampleMail.new�                       sample = SampleMail.new5�_�   
                
       ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �   	                �   	          5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �      
             sample.name = 'User'5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �      
             sample.name = 'User"5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �   	                assert_equal "User"5�_�                           ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �   
                sample.email = '5�_�                           ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�    �   
                sample.email = 'user5�_�                          ����                                                                                                                                                                                                                                                                                                                                          "       v       O�P	    �   
                sample.email = "user5�_�                           ����                                                                                                                                                                                                                                                                                                                                          "       v       O�P�     �               require 'fixuture/sample_mail'5�_�                           ����                                                                                                                                                                                                                                                                                                                                          "       v       O�P�    �               require 'fixture/sample_mail'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        O�R�    �              �                 require 'test_helper'   require 'fixtures/sample_mail'       ,class MailFormTest < ActiveSupport::TestCase   4  test "sample name has nane and mail atrributes" do       #    assert_kind_of Module, MailForm       sample = SampleMail.new       sample.name = "User"   $    assert_equal "User", sample.name   '    sample.email = "user", sample.email     end   end5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                 V        O�S�    �   	            0    assert_equal "user@exaple.com", sample.email5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       O�S�    �                    # assert_nil sample.email�                    # assert_nil sample.name�                    # sample.clear_email�   
                 # sample.clear_name5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       O�Vu    �                   assert_nil sample.email    �                    �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       O�\b   	 �                 end5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                V       O�\�     �               *  test 'can retrive all attributes values"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       O�\�     �                �                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        O�\�     �                ?assert_equal "john.doe@example.com", sample.attributes["email"]�                2assert_equal "John Doe", sample.attributes["name"]�                %sample.email = "john.doe@example.com"�                sample.name = "John Doe"�                sample = SampleMail.new5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  v        O�\�   
 �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�    �   
                 sample.email = "user@ex.com"   ,    assert_equal "user@ex.com", sample.email5�_�   
                 
       ����                                                                                                                                                                                                                                                                                                                                          "       v       O�N�     �   	                s   ample.email = '5��