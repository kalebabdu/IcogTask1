; Computes the factorial of $x recursively.
(= (factorial $x)
    (if (> $x 0)
    (* $x (factorial(- $x 1))) 
    1                          
    )
)

; Calculates the binomial coefficient C(n, k).
(= (binomial $n $k) 
    (/ (factorial $n) (* (factorial (- $n $k)) (factorial $k))) ; C(n, k) = n! / (k! * (n - k)!)
)

; Generates the elements of Pascal's Triangle for row $n.
(= (pascal_triangle $n $k)
    (if (>= $k 0)
    ((binomial $n $k)(pascal_triangle $n (- $k 1))) ; Calls itself to generate all elements of the row
    ()
    )
)

; Outputs the entire row $n of Pascal's Triangle.
(= (row_number $n) 
    (pascal_triangle $n $n)
)

(=(rows $x) 
    (if (>= $x 0)
    ((row_number $x) (rows(- $x 1)))
    ()
    )
)

; Calls the function to print the 2nd row of Pascal's Triangle.
!(rows 3)