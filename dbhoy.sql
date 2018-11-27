--1)You are given an array of n integers, array = [ar[0],ar[1],ar[2],...,ar[n-1]], and a positive integer, k. 
--Find and print the number of (i,j) pairs where i < j and ar[i] + ar[j] is divisible by k.
--For example, array = [1,2,3,4,5,6] and k = 5. Our three pairs meeting the criteria are [1,4], [2,3] and [4,6].
CREATE TYPE number_array AS VARRAY(100) OF INTEGER;

CREATE OR REPLACE FUNCTION divisible_sum_pairs(numeros number_array, k INTEGER)
RETURN INTEGER
AS
 valor INTEGER;
 ex EXCEPTION;
 ex2 EXCEPTION;
BEGIN
    valor := 0;
    
    IF k <= 1
          THEN 
            raise ex;
    else if k >= 100
          then
          raise ex;
          end if;
    END IF;
    
    for i in 1..numeros.count loop
    
        IF numeros(i) <= 1
          THEN 
            raise ex;
        else if numeros(i) >= 100
              then
              raise ex;
              end if;
        END IF;
    
        for j in 1..numeros.count loop
            if (i < j) then
                
               IF MOD(numeros(i) + numeros(j), k) = 0 then
                    valor := valor + 1;
               end if;
               
            end if;             
        end loop;
    end loop;  
  
    return valor;
    
    EXCEPTION
          WHEN ex THEN
            DBMS_OUTPUT.put_line('The value of k doesnt meet the criteria 1 <= k <= 100');
            RETURN NULL;
          WHEN ex2 THEN
            DBMS_OUTPUT.put_line('The length of the array doesnt meet the criteria 1 <= ar[i] <= 100');
            RETURN NULL;
  
END;


--2) Punto dos 
CREATE OR REPLACE FUNCTION divisible_sum_pairs(d INTEGER, n INTEGER)
RETURN INTEGER
AS
 valores number_array;
 valor INTEGER;
BEGIN
    valores := substr(d);
    valor := 0;
    for i in 1..valores.count loop
        if valores(i)/n
        then
         valor := valor + 1;
        end if;
    end loop;  
    
    return valor;
END;


