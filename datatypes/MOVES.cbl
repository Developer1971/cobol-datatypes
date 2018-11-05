      ******************************************************************
      * Author:        Developer1971
      * Date:          05/11/2018
      * Purpose:       Demonstrate COBOL "move" rules for different
      *                sized fields for Pic 9 v Pic X.
      * Tectonics:
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  TEST-DATA.
       05      PICXFIVE PIC X(5).
       05      PICXSIX  PIC X(6) VALUE "123456".
       05      PIC9FIVE PIC 9(5).
       05      PIC9SIX  PIC 9(6) VALUE 123456.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            MOVE PICXSIX TO PICXFIVE
            DISPLAY PICXFIVE
            MOVE PIC9SIX TO PIC9FIVE
            DISPLAY PIC9FIVE
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
