page 50100 "DepartamentosList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Departamentos;
    Caption = 'Departamentos';
    CardPageId = "DepartamentosCard";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
