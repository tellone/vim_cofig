Vim�UnDo� ��d��v��}��� ��W<Cաe�柯&k�++h      require 'fixtures/smaple_mail'                             O���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             O��     �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             O��G     �                  require 'fixtures/smaple_mail.rb5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O��}     �                   test 'sap'5�_�                       +    ����                                                                                                                                                                                                                                                                                                                                                             O���     �                 4  test 'sample mail has name and email as atributes'5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                                             O���     �                 5  test 'sample mail has name and email as attributes'5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O���     �                     sample.user5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O���     �                     sample.name = user5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             O���     �                     sample.name = User5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             O���     �                     sample.name = 'User5�_�   	              
   	       ����                                                                                                                                                                                                                                                                                                                                                             O��     �                     sample.email = user5�_�   
                 	       ����                                                                                                                                                                                                                                                                                                                                                             O��     �                     sample.email = "user5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             O��     �                     sample.email = 'user5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             O��     �                     sample.email = 'user5�_�                    
        ����                                                                                                                                                                                                                                                                                                                            
           
           V        O��#     �   	            �   	   
           5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
           
   #       V        O��)     �   	              $    assert_equal "User", sample.name5�_�                    
   /    ����                                                                                                                                                                                                                                                                                                                            
           
   #       V        O��3    �   	              /    assert_equal "user@exaple.com", sample.name5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
           
   #       V        O���     �   
          5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       O���     �             �   
              end�   
                  end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       O���     �   
             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v        O���     �                assert_nil sample.email�                assert_nil sample.name�                sample.clear_email�   
             sample.clear_name5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       O���    �                    assert_nil sample.email�                    assert_nil sample.name�                    sample.clear_email�   
                 sample.clear_name5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       O���    �               require 'fixtures/smaple_mail'5��