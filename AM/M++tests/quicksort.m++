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
 
 
 fun quicksort(L:listint):listint
     { var z:listint;
       begin
 
       case L of { #NIL => z:= #NIL
                 | #CONS(a,as) => 
       { fun left_part(a:int,as:listint):listint
         { var z:listint;
         begin
           case as of { #NIL => z:= #NIL()
                      | #CONS(x,y) => 
                            if x<a then z:= #CONS(x,left_part(a,y))
                            else z:= left_part(a,y) };
                          return z;
         end };

         fun right_part(a:int,as:listint):listint
         { var z:listint;
           begin
             case as of { #NIL => z:= #NIL()
                        | #CONS(x,y) => 
                            if x>=a then z:= #CONS(x,right_part(a,y))
                            else z:= right_part(a,y) };
                          return z;
           end };
        begin
          z:= append(quicksort(left_part(a,as))
                    ,#CONS(a,quicksort(right_part(a,as))));
        end }
               };
      return z;
    end };

fun append(x:listint,y:listint):listint
  { var z: listint;
    begin
     case x of { #NIL => z:= y 
               | #CONS(v,vs) => z:= #CONS(v,append(vs,y)) };
     return z;
    end };

begin 
   xs:= readints();
   a:= writeints(quicksort(xs));
end
          
