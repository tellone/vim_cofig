Vim�UnDo� �dC)�xt�|v�ʫx���_|�su�[�   M       K          F       F   F   F    O�)�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             O�%�    �          J      !        for j in xrage(nr_knots):5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      from scipy.integrate import*,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�    �         J      from scipy.integrate import *,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J              self.d=points5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J          if pt_type=='ctrl':5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�    �         J          if pt_type =='ctrl':5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      0    tol=0.00001 #sharpness for the support areat5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J          degree=25�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      degree=25�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      ,tol=0.00001 #sharpness for the support areat5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J          if pt_type == 'ctrl':5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J              self.d=points5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J              if knots==0:5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J                  temp=len(self.d)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      )            self.knots=linspace(0,1,temp)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      )            self.knots=linspace(0,1,temp)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J          elif pt_type=='interp':5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J              pass5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�     �         J      	    else:5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             O�%�    �         J      @        raise ValueError('pt_type can either be ctrl or interp')5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             O�&$     �   %   '   J      ,            d_new=d[ind-self.degree+1:ind+2]5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             O�&%     �   %   '   J      -            d_new =d[ind-self.degree+1:ind+2]5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             O�&'     �   %   '   J      .            d_new = d[ind-self.degree+1:ind+2]5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             O�&(     �   %   '   J      /            d_new = d[ind- self.degree+1:ind+2]5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             O�&/     �   $   &   J                      ind=degree+15�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             O�&0     �   $   &   J                      ind =degree+15�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             O�&2     �   $   &   J                      ind = degree+15�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             O�&2     �   $   &   J                      ind = degree +15�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             O�&4     �   #   %   J                  if ind-degree+1<0:5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             O�&5     �   #   %   J                  if ind-degree+1< 0:5�_�                     $       ����                                                                                                                                                                                                                                                                                                                                                             O�&6     �   #   %   J                   if ind-degree+1 < 0:5�_�      !               $       ����                                                                                                                                                                                                                                                                                                                                                             O�&6     �   #   %   J      !            if ind-degree+ 1 < 0:5�_�       "           !   $       ����                                                                                                                                                                                                                                                                                                                                                             O�&8     �   #   %   J      "            if ind-degree + 1 < 0:5�_�   !   #           "   $       ����                                                                                                                                                                                                                                                                                                                                                             O�&:    �   #   %   J      #            if ind- degree + 1 < 0:5�_�   "   $           #   '   %    ����                                                                                                                                                                                                                                                                                                                                                             O�&I     �   &   (   J      ,            return de_boor(x_in, ind,d_new))5�_�   #   %           $   #       ����                                                                                                                                                                                                                                                                                                                            '           '           V        O�&`     �   "   $   J              if pt_tupe=='ctrl':5�_�   $   &           %   "       ����                                                                                                                                                                                                                                                                                                                            '           '           V        O�&�     �   !   $   J                      break5�_�   %   '           &   *   !    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   )   ,   K      !            return interpolate():5�_�   &   (           '   *   !    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�    �   )   +   L      !            return interpolate():5�_�   '   )           (   (   -    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�    �   '   )   L      -            return de_boor(x_in, ind, d_new))5�_�   (   *           )   0       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   /   1   L      &        if ab is None: # guess a and b5�_�   )   +           *   0       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   /   1   L      &        if ab is None: # guess a and b5�_�   *   ,           +   -   5    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   ,   /   L      5        raise TypeError('do not add bsplines morron')5�_�   +   -           ,   4       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   3   5   M                  h = b-a5�_�   ,   .           -   4       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   3   5   M                  h = b -a5�_�   -   /           .   5       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�     �   4   6   M                   a -= self. margin *h5�_�   .   0           /   6       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�&�    �   5   7   M                   b += self. margin *h5�_�   /   1           0   7       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'     �   6   8   M              else:5�_�   0   2           1   8       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'     �   7   9   M                  a,b = ab5�_�   1   3           2   1       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'
     �   0   2   M      "    if ab is None: # guess a and b5�_�   2   4           3   7       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'   	 �   6   8   M      	    else:5�_�   3   5           4   /       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'     �   .   0   M      *    def plot(self, ab=False, check=False):5�_�   4   6           5   0       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'#   
 �   /   1   M      /               """" plots the polynomail if """5�_�   5   7           6   D   "    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�';     �   C   E   M      I            alpha=self.knots[ind]-u_in/(self.knots[ind+1]-self.knots[ind]5�_�   6   8           7   D   '    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'<     �   C   E   M      J            alpha=self.knots[ind]- u_in/(self.knots[ind+1]-self.knots[ind]5�_�   7   9           8   D   )    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'<     �   C   E   M      K            alpha=self.knots[ind]- u_in /(self.knots[ind+1]-self.knots[ind]5�_�   8   :           9   E   "    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'G     �   D   F   M      "        except(ZeroDivisionError):5�_�   9   ;           :   F       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'I    �   D   F   M      !        except(ZeroDivisionError)    �   E   G   M                  alpha=05�_�   :   <           ;   E   !    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'S    �   D   F   L      !        except(ZeroDivisionError)5�_�   ;   =           <   E   .    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'^     �   D   F   L      .                    except(ZeroDivisionError):5�_�   <   >           =   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'a     �   D   F   L      -                    except(ZeroDivisionError)5�_�   =   ?           >   E   !    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�'g    �   D   F   L      !        except(ZeroDivisionError)5�_�   >   @           ?   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�    �   D   F   L      !        except(ZeroDivisionError)5�_�   ?   A           @   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   D   F   L               raise(ZeroDivisionError)5�_�   @   B           A   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   D   F   L      !        execpt(ZeroDivisionError)5�_�   A   C           B   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   D   F   L               excpt(ZeroDivisionError)5�_�   B   D           C   E   !    ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   D   F   L      !        except(ZeroDivisionError)5�_�   C   E           D   E       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   D   F   L      .                    except(ZeroDivisionError):5�_�   D   F           E   B       ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�     �   A   D   L              divi=diff(d_new)5�_�   E               F   K        ����                                                                                                                                                                                                                                                                                                                            (           (           V        O�)�    �   J   L   M       5��