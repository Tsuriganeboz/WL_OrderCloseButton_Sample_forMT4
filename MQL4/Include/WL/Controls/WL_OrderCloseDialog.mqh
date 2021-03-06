//+------------------------------------------------------------------+
//|                                          WL_OrderCloseDialog.mqh |
//|                                    Copyright 2016, Tsuriganeboz  |
//|                                  https://github.com/Tsuriganeboz |
//+------------------------------------------------------------------+
#include <Controls/Dialog.mqh>
#include <Controls/Button.mqh>

#property copyright "Copyright 2016, Tsuriganeboz"
#property link      "https://github.com/Tsuriganeboz"
#property version   "1.00"
#property strict

//--- 
#define WL_DIALOG_BUTTON_NAME_CLOSE_ALL    "WL_DialogCloseAll"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class WL_OrderCloseDialog : public CAppDialog
  {
private:
   CButton btnCloseAll;
public:
                     WL_OrderCloseDialog();
                    ~WL_OrderCloseDialog();
                    
   // 
   virtual bool Create();   
   virtual void Destroy(const int reason = 0);

   virtual void  OnClickButtonClose();

private:
   bool CreateAndAddButton(CButton& button, string name, string text,
                           int x1, int y1, int x2, int y2);

  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
WL_OrderCloseDialog::WL_OrderCloseDialog()
  {
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
WL_OrderCloseDialog::~WL_OrderCloseDialog()
  {
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+  
void WL_OrderCloseDialog::Destroy(const int reason = 0)
{
   btnCloseAll.Destroy(reason);
   
   CAppDialog::Destroy(reason);
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+  
void WL_OrderCloseDialog::OnClickButtonClose()
{
   // 何もしない。
}
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool WL_OrderCloseDialog::CreateAndAddButton(CButton& button, string name, string text,
                                             int x1, int y1, int x2, int y2)
{
   if (!button.Create(0, name, 0, x1, y1, x2, y2))
      return false;

   if (!button.Font("Terminal")) return false;
   if (!button.Text(text)) return false;

   if (!Add(button))
      return false;

   return true;
}                          
                             
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool WL_OrderCloseDialog::Create()
{
   if (!CAppDialog::Create(0, "Order Close", 0, 20, 120, (160 + 20), (120 + 120)))
      return false;
      
   int x1 = 10;      
   int x2 = 140;     

   if (!CreateAndAddButton(btnCloseAll,
                           WL_DIALOG_BUTTON_NAME_CLOSE_ALL, "Close All", x1, 10, x2, 80))
      return false;

      
   return true;
}   


//+------------------------------------------------------------------+
