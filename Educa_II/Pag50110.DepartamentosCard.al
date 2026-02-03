page 50110 "DepartamentosCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Departamentos;
    Caption = 'Ficha departamento';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Código"; Rec."Código")
                {
                    ApplicationArea = All;
                }
                field("Edificio"; Rec."Edificio")
                {
                    ApplicationArea = All;
                }
                field("Delegado"; Rec."Delegado")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
