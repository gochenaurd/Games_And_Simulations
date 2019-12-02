
//This program is minesweeper

//Things to do:
  //Create bomb counter
  //Give ability to flag bombs
  //Remove bomb array print main code and function

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>

#define ROWSIZE 16
#define COLSIZE 16
#define NUMBBOMBS 40
#define GAMEWIN 1
#define GAMELOSS -1

void printOpening();
void setBombs(int[][COLSIZE], int, int, int);                 //place the bombs in the bomb array
void setCount(int[][COLSIZE]);                                //set the number slots around the bombs
void printBombArray(int[][COLSIZE]);                          //print the bomb array //remove in final version
int winTest(int[][COLSIZE], int[][COLSIZE], int, int);        //test the state of the game
void setPrintArray(int[][COLSIZE], int[][COLSIZE], int, int); //create the print array as slots are guessed
void printPrintArray(int[][COLSIZE]);                         //print the print array
void initialPrintArray(int[][COLSIZE]);                       //initialize the print array
void printResult(int[][COLSIZE], int[][COLSIZE], int);        //print the result of the game

int main()
{
  //Variable Declarations
  int bombArray[ROWSIZE][COLSIZE] = {{0}};  //bomb and number place array
  int printArray[ROWSIZE][COLSIZE];         //array showing slots revealed by user
  int winState = 0;                         //1 or -1 if the game has been won or lost
  int rowGuess;                             //the user row guess
  int colGuess;                             //the user column guess
  
  //Statements
  printOpening();

  initialPrintArray(printArray);
  printPrintArray(printArray);

  printf("\nEnter a starting row and column number: ");
  scanf("%d %d", &rowGuess, &colGuess);

  setBombs(bombArray, NUMBBOMBS, (rowGuess - 1), (colGuess - 1));  //set bombs with original guess to create fenced area
  setCount(bombArray);
  setPrintArray(bombArray, printArray, (rowGuess - 1), (colGuess - 1));

  while((winState != GAMEWIN) && (winState != GAMELOSS))
  {
    //printBombArray(bombArray);          //display as necessary while editing code

    printPrintArray(printArray);

    printf("\n");
    printf("Enter a row and a column number: ");
    scanf("%d %d", &rowGuess, &colGuess);

    setPrintArray(bombArray, printArray, (rowGuess - 1), (colGuess - 1));

    winState = winTest(bombArray, printArray, (rowGuess - 1), (colGuess - 1));
  }

  printResult(bombArray, printArray, winState);

  return(0);
} 

//To initialize the print array with values of 100
void initialPrintArray(int printArray[][COLSIZE])
{
  int lcv;
  int lcvNest;

  for(lcv = 0; lcv < ROWSIZE; lcv++)
  {
    for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++)
    {
      printArray[lcv][lcvNest] = 100;
    }
  }
  return;
}

//To place the bombs in the array
void setBombs(int bombArray[][COLSIZE], int bombs, int rowGuess, int colGuess)
{
  int randRow;
  int randCol;
  int touchCheck;
  int lcv;
  int bombPlace = 0;

  srand((unsigned)time(NULL));

  for(lcv = 1; lcv <= bombs; lcv++)
  {
    touchCheck = 0;

    randRow = (rand() % ROWSIZE);
    randCol = (rand() % COLSIZE);

    touchCheck = ((randCol == (colGuess - 1)) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));
    touchCheck += ((randCol == (colGuess + 1)) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));
    touchCheck += ((randCol == colGuess) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));

    while((bombPlace != lcv))
    {
      if((bombArray[randRow][randCol] != -1) &&  (touchCheck == 0))
      {
        bombArray[randRow][randCol]--;
        bombPlace++;
      }
      else
      {
        touchCheck = 0;

        randRow = (rand() % ROWSIZE);
        randCol = (rand() % COLSIZE);

        touchCheck = ((randCol == (colGuess - 1)) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));
        touchCheck += ((randCol == (colGuess + 1)) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));
        touchCheck += ((randCol == colGuess) && (randRow >= (rowGuess - 1) && randRow <= (rowGuess + 1)));
      }
    }
  }
  return;
}

//To set the numbers surrounding the bombs
void setCount(int bombArray[][COLSIZE])
{
  int lcv;
  int lcvNest;
  int checkLcv;
  int checkNest;

  for(lcv = 0; lcv < ROWSIZE; lcv++) //original row
  {
    for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++) //original column
    {
      if(bombArray[lcv][lcvNest] != -1)
      {
        for(checkLcv = (lcv - 1); checkLcv <= (lcv + 1); checkLcv++) //check row
        {
          for(checkNest = (lcvNest - 1); checkNest <= (lcvNest + 1); checkNest++) //check column
          {
            if((checkLcv >= 0) && (checkLcv < ROWSIZE) && (checkNest >= 0) && (checkNest < COLSIZE) && (bombArray[checkLcv][checkNest] == -1))
            {
              bombArray[lcv][lcvNest]++;
            }
          } //check column
        } //check row
      }//test lcv range
    } //original column
  } //oroginal row
  return;
}

//To print the opening header
void printOpening()
{
  int start;

  printf("\nWelcome to Mine Sweeper!\n");
  printf("Press any number to start. ");

  scanf("%d", &start);

  return;
}

//To test the game outcome
int winTest(int bombArray[][COLSIZE], int printArray[][COLSIZE], int rowGuess, int colGuess)
{
  int lcv;
  int lcvNest;
  int count = 0;
  int winState = 0;

  for(lcv = 0; lcv < ROWSIZE; lcv++)
  {
    for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++)
    {
      if(printArray[lcv][lcvNest] == 100)
      {
        count++;
      }
    }
  }

  if(bombArray[rowGuess][colGuess] == -1)
  {
    winState = -1;
  }
  else if(count == NUMBBOMBS )
  {
    winState = 1;
  }

  return(winState);
}

//To display the empty space as it is hit
void setPrintArray(int bombArray[][COLSIZE], int printArray[][COLSIZE], int rowSlot, int colSlot)
{
  int lcv;
  int lcvNest;

  if(bombArray[rowSlot][colSlot] == 0)
  {
    for(lcv = (rowSlot - 1); lcv <= (rowSlot + 1); lcv++) //original row
    {
      for(lcvNest = (colSlot - 1); lcvNest <= (colSlot + 1); lcvNest++) //original column
      {
        if((lcv >= 0) && (lcv < ROWSIZE) && (lcvNest >= 0) && (lcvNest < COLSIZE))
        {
          if((bombArray[lcv][lcvNest] == 0) && (printArray[lcv][lcvNest] != 0))
          {
            printArray[lcv][lcvNest] = 0;
            setPrintArray(bombArray, printArray, lcv, lcvNest); //recursive case revealing slots boardering zeros
          }
          else if(bombArray[lcv][lcvNest] >= 1)
          {
            printArray[lcv][lcvNest] = bombArray[lcv][lcvNest];
          }
        }
      }
    }
  }
  else
  {
    printArray[rowSlot][colSlot] = bombArray[rowSlot][colSlot];
  }
  return;
}

//To print the print array
void printPrintArray(int array[][COLSIZE])
{
  int lcv;
  int lcvNest;
  int lcvNumb;
  int lcvUnder;

  printf("\n");

  printf("    ");

  for(lcvNumb = 1; lcvNumb <= COLSIZE; lcvNumb++)
  {
    printf("%3d", lcvNumb);
  }

  printf("\n");
  printf("     --");

  for(lcvUnder = 1; lcvUnder < COLSIZE; lcvUnder++)
  {
    printf("---");
  }

  printf("\n");

  for(lcv = 0; lcv < ROWSIZE; lcv++)
  {
    printf(" %2d |", (lcv + 1));

    for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++)
    {
      if(array[lcv][lcvNest] != 100)
      {
        printf("%2d ", array[lcv][lcvNest]);
      }
      else
      {
        printf(" - ");
      }
    }
    printf("\n");
  }
  return;
}

//To print the bomb array
void printBombArray(int array[][COLSIZE])
{
  int lcv;
  int lcvNest;
  int lcvNumb;
  int lcvUnder;

  printf("    ");

  for(lcvNumb = 1; lcvNumb <= COLSIZE; lcvNumb++)
  {
    printf("%3d", lcvNumb);
  }
  
  printf("\n");
  printf("     --");

  for(lcvUnder = 1; lcvUnder < COLSIZE; lcvUnder++)
  {
    printf("---");
  }

  printf("\n");

  for(lcv = 0; lcv < ROWSIZE; lcv++)
  {
    printf(" %2d |", (lcv + 1));

    for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++)
    {
      if((array[lcv][lcvNest] != -1) && (array[lcv][lcvNest] != 99))
      {
        printf("%2d ", array[lcv][lcvNest]);
      }
      else if(array[lcv][lcvNest] == 99)
      {
        printf(" B ");
      }
      else
      {
        printf("   ");
      }
    }
    printf("\n");
  }
  return;
}

//To print the result of the game
void printResult(int bombArray[][COLSIZE], int printArray[][COLSIZE], int winstate)
{
  int lcv;
  int lcvNest;
  int lcvNumb;
  int lcvUnder;

  if(winstate == GAMEWIN)
  {
    printPrintArray(printArray);
    printf("\nYou swept all the bombs!\n");
    printf("You win!\n\n");
  }
  else
  {
    printf("\n");

    printf("    ");

    for(lcvNumb = 1; lcvNumb <= COLSIZE; lcvNumb++)
    {
      printf("%3d", lcvNumb);
    }
  
    printf("\n");
    printf("     --");

    for(lcvUnder = 1; lcvUnder < COLSIZE; lcvUnder++)
    {
      printf("---");
    }

    printf("\n");

    for(lcv = 0; lcv < ROWSIZE; lcv++)
    {
      printf(" %2d |", (lcv + 1));

      for(lcvNest = 0; lcvNest < COLSIZE; lcvNest++)
      {
        if(bombArray[lcv][lcvNest] == -1)
        {
          printf(" X ");
        }
        else if(printArray[lcv][lcvNest] == 100)
        {
          printf(" - ");
        }
        else
        {
          printf("%2d ", printArray[lcv][lcvNest]);
        }
      }
      printf("\n");
    }
    printf("\nYou hit a bomb and died!\n");
    printf("You lose.\n\n");
  }
  return;
}
