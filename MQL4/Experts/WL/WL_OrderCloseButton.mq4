//+------------------------------------------------------------------+
//|                                          WL_OrderCloseButton.mq4 |
//|                                    Copyright 2016, Tsuriganeboz  |
//|                                  https://github.com/Tsuriganeboz |
//+------------------------------------------------------------------+

#include <stdlib.mqh>
#include <WL/Controls/WL_OrderCloseDialog.mqh>
#include <WL/WL_OrderUtil.mqh>
#include <WL/WL_OrderCloseAll.mqh>
#include <WL/WL_Sound.mqh>

#property copyright "Copyright 2016, Tsuriganeboz"
#property link      "https://github.com/Tsuriganeboz"
#property version   "1.00"
#property strict

//---
sinput int InpSlippage = 3;   // スリッページ


//---
WL_OrderCloseDialog* g_pDialog;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---   
   g_pDialog = new WL_OrderCloseDialog;
      
   // 
   if (!g_pDialog.Create())
      return (INIT_FAILED);
   
   if (!g_pDialog.Run())
      return (INIT_FAILED);
      
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   g_pDialog.Destroy(reason);
   delete g_pDialog;
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   g_pDialog.ChartEvent(id, lparam, dparam, sparam);
   
   if (id == CHARTEVENT_OBJECT_CLICK)
   {
      if (sparam == WL_DIALOG_BUTTON_NAME_CLOSE_ALL)
      {
         bool isOrderClosed = WL_OrderCloseAll();
         
         Print("'Close All' button Pressed.");
      
         if (isOrderClosed)
         {
            Print("Order All Close. --> [" + Symbol() + "]");      
            WL_PlaySoundOk();
         }
         else {}
      }
      else {}

   }
   else {}
     
  }
//+------------------------------------------------------------------+
