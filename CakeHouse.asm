org 100h              ;origin of the program
display macro p1      ; macro for display of string
    mov dx,offset p1  ;making the offset of parameter 1 and move into DX register  
    mov ah,9          ;This will print the String 
    int 21h           ;DOS interuppt 
endm                  ;macro end 

displayp macro p1     ; macro for displaying price
    mov dl,p1         ;moving parameter (p1) into dl register for price
    mov ah,2          ;This will print
    int 21h           ;DOS interuppt 
endm                  ;macro ends

replace macro a1,a2,a3   ; macro for parameters (a1,a2,a3)
  cmp al,49              ;compare the al with 49, whose ASCII code is 1
  je a1                  ;if it's equal to the user input then jump into 1 
  cmp al,50              ;compare the al with 50, whose ASCII code is 2
  je a2                  ;if it's equal to the user input then jump into 2
  cmp al,51              ;compare the al with 51, whose ASCII code is 3
  je a3                  ;if it's equal to the user input then jump into 3
                         
endm                     ;macro ends 

  
macro cls              ; macro for clear screen
    mov ax,0002h       ;moving 0002h into ax register
    int 10h            ;and then doing int 10h
endm                   ;macro ends


ur_choice macro        ;macro for your choice
   call newline        ;calling the newline procedure
   display your_choice ;calling themacro "display" with varibale your choice
                                
endm                   ;macro ends

                       
.model small
.stack 100h
.data                  ;data part, here we'll initialize and declare variables

price1 db  53          ;This mentioned the price 1 for 53 which has its ASCII of 5 with type of define byte
price2 db  53          ;This mentioned the price 2 for 53 which has its ASCII of 5 with type of define byte
price3 db  53          ;This mentioned the price 3 for 53 which has its ASCII of 5 with type of define byte
price4 db  57          ;This mentioned the price 4 for 53 which has its ASCII of 9 with type of define byte
price5 db  57          ;This mentioned the price 5 for 53 which has its ASCII of 9 with type of define byte
price6 db  57          ;This mentioned the price 6 for 53 which has its ASCII of 9 with type of define byte
menu db "1.Purchase Item",10,13,"2.Admin",10,13,"3.Exit$" ;Menu variable with define byte having (Purchase Item),(Admin),(Exit)with newline statements of 10 and 13. 10 is for newline and 13 is for correct placement
your_choice db 10,13,"Your Choice: $" ;this is variable of your choice with newline (10,13) ,describe the string 
design db "====================================$" ;The design variable display the design
str1 db 10,13,"*WELCOME TO CAKE HOUSE MANAGEMENT SYSTEM*$"  ;the variable str1 display the message
str1a db "PRESS 1 FOR CUPCAKES" ,10,13, "PRESS 2 FOR POUND CAKES" ,10,13, "PRESS 3 TO EXIT$" ;the variable str1a display's the message for (cup-cakes, pound cakes and Exit) with newline
str1b db 10,13,"MENU: ",10,13,"1.Nutella Cupcake ",10,13,"2.Blue Berry Cupcake",10,13,"3.Lotus Cupcake ","$" ;the variable str1b display's the message for (menu, nutella cupcake , lotus cupcake, blue-berry cupcake) with newline
str1c db 10,13,"MENU: ",10,13,"1.Red velvet Cake",10,13,"2.Kitkat Cake",10,13,"3.Cheese Cake$" ;the variable str1c display's the message for (menu, red velvet cake , kitkat cake, cheese cake) with newline   
buy_again db 10,13,"DO YOU WANT TO BUY MORE ? PRESS Y FOR YES OR ANY LETTER TO SEE BILL: $"  ;the buy again variable with define byte and newline display the msg, DO YOU WANT TO BUY MORE ? PRESS Y FOR YES OR ANY LETTER TO SEE BILL 
total_bill_is db 10,13,"Your total bill is: $" ;Total bill variable will display the bill in define byte
thankyou db 10,13,"THANKYOU FOR CHOOSING CAKE HOUSE$" ;Thank you variable for displaying the message 
boolean db ?   ;Here's a boolean variable that will use in main proc code
str db 10,13,10,"Enter your password: $" ;str variable with newline is asking the user to enter password 
str2 db 10,13,"Enter the dollar price to update: $" ;str2 will asking the price in dollar
str4 db 10,13,"PRICE SET$" ;str set your price accordingly
pass db "4997$"            ;here's the password of Cake House Management System
arr3 db 30 dup ('$')       ;arr3 variable can take 30 integers 
totalb db ?                ;veriable of total will calculate the total
nutellaprice db "1.Nutella Cupcake Price: $"    ;variables nutellaprice with string
blueberryprice db "2.BlueBerry Cupcake Price: $";variable blueberryprice with string
lotusprice db "3.Lotus Cupcake Price: $"   ;variables lotusprice  with string
Redvelvetprice db "1.Red Velvet Price: $" ;variables Redvelvetprice with string
Kitkatprice db "2.Kitkat Cake Price: $"   ;variables Kitkatprice with string
Cheeseprice db "3.Cheese Cake Price: $"  ;variables Cheeseprice  with string
goodbye db "GOODBYE!",10,13,"CREATED BY:",10,13,"Kumkum Wadhwani$" ;This will execute out program with good bye msg and with our names
dollar db 36    ;taking dollar variable with 36 the ASCII of 36 is dollar($)
.code           ;code start


main proc        ;start of the program
    
    mov ax,@data ;calling the data and move into ax register
    mov ds,ax    ;mov ax into DS (data segment) to access the data
MAIN_MENU:       ;label for main_menu
  
    mov totalb,0   ;moving 0 into totalb 
     call newline  ;calling newline 
    display design ;call display macro with design variable, will display design 
    display str1   ;call display macro with str1 variable, will display WELCOME TO CAKE HOUSE MANAGEMENT SYSTEM 
    call newline   ;calling newline 
    display menu   ;call display macro with menu variable, will display Purchase Item, Admin, Exit 
    call newline   ;calling newline 
    display design ;call display macro with design variable, will display design
    ur_choice      ;calling ur_choice macro
    call input     ;calling input
    replace Purchase,Password_input,Exit ;calling the replace macro here for purchase,password_input and exit 
    

Password_input:  ;label for password 
    mov si,0     ;moving 0 in si
    display str  ;displaying macro
L1:              ;L1 loop start
    mov ah,7     ;Input without eco      
    int 21h      ;interrupt     
    cmp al,13    ;comaring user input       
    je check_password ;checking for password           
    mov arr3[si],al   ;using array variable for password size     
    mov dl,42         ;password hide and shows staric
    mov ah,2          ;for print
    int 21h           ;interrupt
    inc si            ;increment si
    jmp l1            ;jump on loop l1 
    
    
check_password:       ;checks password label
    cls               ;clear screen
    mov cx,9          ;setting counter to 9
    mov si,0          ;moving 0 into source index
                        
check:                ;check

    mov bh,pass[si]   ;moving values for password into bh 
    mov bl,arr3[si]   ;moving into bl
    cmp bh,bl         ;comparing password 
    jne wrong_pass    ;if wrong pass jump onto wrong password label
    inc si            ;increment of si
    jmp DOWNER        ;jump on downer label

    
DOWNER:               ;downer label
    
    cmp cx,si         ;comparing counter with source index
    je admin_function ;if equal than jump on admin function label
                     
DOWNERR:              ;
    loop check     ;closing of password checking loop
    
   
        
WRONG_PASS:  ;label for wrong password

    jmp main_menu  ;jump on main menu label
    

ADMIN_FUNCTION:     ;admin function label
      
     call newline   ;calling newline procedure
     mov boolean,2  ;moving 2 into boolean variable
     display str1a ;display msg for choosing options for cupcake poundcake or exit      
     ur_choice     ;using macro for user choice
     call input    ;calling user input procedure
     replace cupcakes,poundcakes,MAIN_MENU       ;replace macro for comparing user inputs with matching to ascii 

Purchase:   ;purchase label for items in menu shows to user
    
    cls             ;clear screen
    display str1a   ;displaying choice to user for cupcakes or poundcakes
    ur_choice       ;using macro for user choice
    call input      ;calling user input procedure 
    cmp al,49       ;comparing value with ascii 1 that user input
    je N1           ;if equal then jump on N1 label
    cmp al,51       ;comparing with ascii 3
    je main_menu    ;if equal then jump on main menu
    mov boolean,1
    replace cupcakes,poundcakes,exit   ;replace macro for comparing user inputs with matching to ascii
 
N1:                                    ;N1 label
    mov boolean,0                      ;moving 0 into boolean variable
    replace cupcakes,poundcakes,exit   ;replace macro for comparing user inputs with matching to ascii
    
    
    
Nutella_Price:               ;price label for nutella
     call newline            ;calling newline procedure
     display nutellaprice    ;using display macro for showing msg nutella price
     displayp price1         ;using macro displayp for showing nutella price
     displayp dollar         ;displaying dollar variable value
                         
                         
Blueberry_Price:             ;price label for blueberry
     call newline            ;calling newline procedure
     display blueberryprice  ;using display macro for showing msg blueberry price
     displayp price2         ;using macro displayp for showing blueberry price
     displayp dollar         ;displaying dollar variable value
 
Lotus_Price:                 ;price label for lotus
     call newline            ;calling newline procedure
     display lotusprice      ;using display macro for showing msg lotus price
     displayp price3         ;using macro displayp for showing lotus price
     displayp dollar         ;displaying dollar variable value
     ur_choice               ;using macro for user choice
     call input              ;caaling input procedure
     jmp total_bill          ;jump on label total bill
     
Total_Bill:                  ;total bill label
     cmp boolean,1           ;compare with 1 to boolean variable value
     je add_for_cakes        ;if equal then ask user to add cakes  
     
ADD_FOR_CUPCAKES:            ;label for to add cupcakes
     cmp al,49               ;comapre values with ascii
     je  add1                ;if equal than add1
     cmp al,50               ;compare with ascii 
     je  add2                ;if equal than jump on 2
     cmp al,51               ;comapre with ascii 
     je  add3                ;if equal than add 3 
     
ADD_FOR_CAKES:          ;label for cakes
    cmp al, 49          ; Compare the input with ASCII for '1'
    je add4             ; Jump to add4 if equal
    cmp al, 50          ; Compare the input with ASCII for '2'
    je add5             ; Jump to add5 if equal
    cmp al, 51          ; Compare the input with ASCII for '3'
    je add6             ; Jump to add6 if equal
                 
add1:                    ;add1 label
    mov al, price1       ; Load the price of Nutella cupcake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

add2:                    ;add2 label
    mov al, price2       ; Load the price of Blueberry cupcake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

add3:                    ;add3 label
    mov al, price3       ; Load the price of Lotus cupcake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

add4:                    ;add4 label
    mov al, price4       ; Load the price of Red Velvet cake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

add5:                    ;add5 label
    mov al, price5       ; Load the price of Kitkat cake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

add6:                    ;add6 label
    mov al, price6       ; Load the price of Cheese cake into al
    sub al, 48           ; Convert ASCII character to integer
    add totalb, al       ; Add the price to the total bill
    jmp display_buy_again; Jump to display_buy_again to ask for more purchases

     
display_buy_again:      ;display_buy_again label
    display buy_again   ; Display the buy again prompt
    mov ah, 1           ; to take input from the user
    int 21h             ; interrupt
    cmp al, 121         ; Compare the input value with ASCII code for 'Y'
    je please_check     ; Jump to please_check if equal
    jmp show_bill       ; Jump to show_bill to display the total bill

please_check:           ;please_check label
    cmp boolean, 1      ; Compare boolean flag to check for cupcake or poundcake
    je Redvelvet_price  ; Jump to Redvelvet_price if it's cupcake mode
    jmp nutella_price   ; Jump to nutella_price if it's poundcake mode

     
SHOW_BILL:                      ;show bill label
    display total_bill_is       ; Display the string "Your total bill is: "
    mov al, totalb              ; Move the total bill amount into al register
    aam                         ; ASCII adjustment for multiplication
    mov dl, ah                  ; Move the value into dl register
    mov bl, al                  ; Move the al register into bl
    add dl, 48                  ; to convert it into ascii
    mov ah, 2                   ; to print
    int 21h                     ; interrupt
    mov dl, bl                  ; move the bl register into dl register
    add dl, 48                  ; for ascii
    mov ah, 2                   ; to print
    int 21h                     ; interrupt
    displayp dollar             ; Display the dollar sign
    display thankyou            ; Display the thank you message
    mov ah, 7                   ; Set ah to 7
    int 21h                     ; interrupt
    cls                         ; Clear the screen
    jmp main_menu               ; Jump back to the main menu
     
Redvelvet_Price:                ;regvelvet price label
    call newline                ; Display a newline
    display Redvelvetprice      ; Display the string "1.Red Velvet Price: "
    displayp price4             ; Display the Red Velvet Cake price
    displayp dollar             ; Display the dollar sign

Kitkatt_Price:                  ;kitkat price label
    call newline                ; Display a newline
    display kitkatprice         ; Display the string "2.Kitkat Cake Price: "
    displayp price5             ; Display the Kitkat Cake price
    displayp dollar             ; Display the dollar sign
 
Cheese_Price:                   ;cheese_price label
    call newline                ; Display a newline
    display Cheeseprice         ; Display the string "3.Cheese Cake Price: "
    displayp price6             ; Display the Cheese Cake price
    displayp dollar             ; Display the dollar sign
    ur_choice                   ; Display the user's choice prompt
    call input                  ; Call input procedure
    jmp total_bill              ; Jump to calculate the total bill

CUPCAKES:                        ;cupcakes label
    cmp boolean, 0               ; Check if boolean is 0 (cupcakes selected)
    je M1                        ; Jump to M1 if true
    display str1b                ; Display the cupcake menu
    ur_choice                    ; Display the user's choice prompt
    call input                   ; Call input procedure
    jmp M2                       ; Jump to M2

M1:                              ;M1 label
    jmp nutella_price            ; Jump to nutella_price if boolean is 0

M2:                                    ;M2 label
    replace nutella, blueberry, lotus  ; Replace options based on user choice

Nutella:                         ;nutella label
    display str2                 ; Display the prompt for entering Nutella price
    call input                   ; Call input procedure
    mov price1, al               ; Move the entered price for Nutella Cupcake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

Blueberry:                       ;Blueberry label
    display str2                 ; Display the prompt for entering Blueberry price
    call input                   ; Call input procedure
    mov price2, al               ; Move the entered price for Blueberry Cupcake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

Lotus:                           ;lotus label
    display str2                 ; Display the prompt for entering Lotus price
    call input                   ; Call input procedure
    mov price3, al               ; Move the entered price for Lotus Cupcake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

POUNDCAKES:                      ;Poundcakes label
    cmp boolean, 1               ; Check if boolean is 1 (poundcakes selected)
    je M3                        ; Jump to M3 if true
    display str1c                ; Display the poundcakes menu
    ur_choice                    ; Display the user's choice prompt
    call input                   ; Call input procedure
    jmp M4                        ; Jump to M4

M3:                              ;M3 label
    jmp Redvelvet_price          ; Jump to Redvelvet_price if boolean is 1

M4:                                    ;M4 label
    replace Redvelvet, Kitkat, cheese  ; Replace options based on user choice

Redvelvet:                       ;Redvelvet label
    display str2                 ; Display the prompt for entering Red Velvet price
    call input                   ; Call input procedure
    mov price4, al               ; Move the entered price for Red Velvet Cake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

Kitkat:                          ;kitkat label
    display str2                 ; Display the prompt for entering Kitkat price
    call input                   ; Call input procedure
    mov price5, al               ; Move the entered price for Kitkat Cake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

Cheese:                          ;cheese label
    display str2                 ; Display the prompt for entering Cheese price
    call input                   ; Call input procedure
    mov price6, al               ; Move the entered price for Cheese Cake
    display str4                 ; Display the "PRICE SET" message
    jmp ADMIN_FUNCTION           ; Jump to the admin function

Exit:                            ;exit label to terminate the code
    cls                          ; Clear the screen
    display goodbye              ; Display the goodbye message
    .exit                        ; Exit the program
    
main endp                        ;end of the main procedure
 

input proc           ; Input procedure
    mov ah, 1        ; to take input from the user
    int 21h          ; Call interrupt 
    ret              ; Return from the procedure
input endp           ; End of the input procedure


newline proc         ; Newline procedure
    mov dl, 13       ; Move ASCII code 13 (carriage return) into the DL register
    mov ah, 2        ; for print
    int 21h          ; Call interrupt 

    mov dl, 10       ; Move ASCII code 10 (line feed) into the DL register
    mov ah, 2        ;for print
    int 21h          ; Call interrupt

    ret              ; Return from the procedure
newline endp         ; End of the newline procedure
