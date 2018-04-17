/* 
 *   Program for sorting lists of integers.
 *   
 */
 
 
 data listint = #CONS of int * listint
               | #NIL ;
 
 var xs: listint;
 var a: bool;
 
 fun readints():listint
     { var x:int; 
       var zL:listint;
       begin 
         read x;
         if x = 0 then zL:= #NIL()
                  else zL:= #CONS(x,readints());
         return zL;
       end };
 
 fun writeints(zL:listint):bool
     { var a: bool;
       begin
         case zL of  { #NIL => a:= true
                     | #CONS(x,yL) => 
            { begin 
                print x;
                a:= writeints(yL);
              end  
            }        };
       return a;
     end };
 
 fun merge(x:listint,y:listint):listint
     { var z:listint;
       begin
         case x of { #NIL => z:= y
                   | #CONS(xh,xt) =>
             { begin 
                case y of { #NIL => z:= x
                          | #CONS(yh,yt) =>
                if xh<yh then z:= #CONS(xh,merge(xt,y))
                         else z:= #CONS(yh,merge(x,yt))
                          };
               end }
                   };
         return z;
      end };
      
 fun odd(x:listint):listint
     { var zL:listint;
       begin 
         case x of { #NIL => zL:= #NIL() 
                   | #CONS(z,tx) => zL:= even(tx) };
         return zL;
       end };
       
 fun even(x:listint):listint
     { var z:listint;
       begin 
         case x of { #NIL => z:= #NIL() 
                   | #CONS(x,tx) => z:= #CONS(x,odd(tx)) };
         return z;
       end };
       
 fun mergesort(z:listint):listint
     { var v:listint;
       begin 
          case z of { #NIL => v:= #NIL
                    | #CONS(a,b) => 
                      { begin
                         case b of { #NIL => v:= #CONS(a,#NIL())
                                   | #CONS(u,w) =>
                         v:= merge(mergesort(odd(z)),mergesort(even(z))) };
                      end } 
                    };
         return v;
       end };

begin 
   xs:= readints();
   a:= writeints(mergesort(xs));
end
          
