//+------------------------------------------------------------------+
//|                                             WL_OrderCLoseAll.mqh |
//|                                    Copyright 2016, Tsuriganeboz  |
//|                                  https://github.com/Tsuriganeboz |
//+------------------------------------------------------------------+

#property copyright "Copyright 2016, Tsuriganeboz"
#property link      "https://github.com/Tsuriganeboz"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool WL_OrderCloseAll()
{
   bool result = false;

   for (int i = (OrdersTotal() - 1); i >= 0; i--)
   {
      result = true;
   
      if (WL_OrderSelectByPos(i) 
         && WL_IsOrderSymbolMatch()
         )
      {
         if (WL_IsWaitingOrder())
         {
            bool ret = OrderDelete(OrderTicket());
		      WL_PrintOrderError(ret);
         }
         else
         {
            //int slippage = 3;
		      bool ret = WL_OrderCloseAllLots(InpSlippage, Yellow);
		      WL_PrintOrderError(ret);
         }      
      }
      else {}
   }
   
   return result;
}
