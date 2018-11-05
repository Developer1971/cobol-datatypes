      ******************************************************************
      * Author:      Developer1971
      * Date:        24/10/2018
      * Purpose:     Test how COBOL datatypes are represented as bytes
      * Platform:    OpenCobolIDE
      * Notes:       Use HxD hex editor to examine output.
      ******************************************************************
      * PIC 1(8) would be the same as PIC 9(1) COMP-5.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUT ASSIGN TO "data.output".
       DATA DIVISION.
       FILE SECTION.
       FD  OUT.
       01  OUT-REC.
      *        A byte set to ANSI value for each character.
       05      OUT-REC-PICX-SIX PIC X(6).
       05      FILLER PIC X(1) VALUE "*".
      *        A byte set to ANSI value for each digit.
       05      OUT-REC-PIC9-SIX PIC 9(6).
       05      FILLER PIC X(1) VALUE "*".
      *
       05      OUT-REC-PIC9-COMP5 PIC 9(1) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
      *        Convert to binary and store in little endian format.
      *        Note: Endian format depends on environment.
      *        Little endian for windows using OpenCobolIDE.
      *        E.g. 61693(dec) = 1111000011111101(binary)
      *        Move higher order byte to higher memory address.
      *        1111110111110000
      *        So we get bytes... FD F0
       05      OUT-REC-PIC9-FOUR-COMP5 PIC 9(4) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
       05      OUT-REC-PIC9-SIX-COMP5 PIC 9(6) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
       05      OUT-REC-PIC9-TWO-COMP PIC 9(3) COMP.
       05      FILLER PIC X(1) VALUE "*".
       05      OUT-REC-PIC9-FOUR-COMP3 PIC 9(4) COMP-3.
       WORKING-STORAGE SECTION.
       01 WS-PIC.
       05 WS-PICX-SIX  PIC X(6).
       05 FILLER PIC X(1) VALUE "*".
       05 WS-PIC9-SIX  PIC 9(6).
       05      FILLER PIC X(1) VALUE "*".
       05 WS-PIC9-COMP5 PIC  9(1) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
       05 WS-PIC9-TWO-COMP5 PIC 9(4) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
       05 WS-PIC9-SIX-COMP5 PIC 9(6) COMP-5.
       05      FILLER PIC X(1) VALUE "*".
       05 WS-REC-PIC9-TWO-COMP PIC 9(3) BINARY.
       05      FILLER PIC X(1) VALUE "*".
       05 WS-REC-PIC9-FOUR-COMP3 PIC 9(4) COMP-3.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            MOVE "ABC123" TO WS-PICX-SIX
            MOVE 123456 TO WS-PIC9-SIX
            MOVE B"11111111" TO WS-PIC9-COMP5
      *     MOVE B"1111000011111101" TO WS-PIC9-TWO-COMP5
            MOVE 61693 TO WS-PIC9-TWO-COMP5
            MOVE B"00000000110011110000000010000001"
              TO WS-PIC9-SIX-COMP5
            MOVE 255
              TO WS-REC-PIC9-TWO-COMP
            MOVE 1234 TO WS-REC-PIC9-FOUR-COMP3
            OPEN OUTPUT OUT
            WRITE OUT-REC FROM WS-PIC
            CLOSE OUT
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
