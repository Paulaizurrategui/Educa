page 50112 "CursosCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Cursos;
    Caption = 'Ficha curso';

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
                field("Nombre curso"; Rec."Nombre curso")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Edificio"; Rec."Edificio")
                {
                    ApplicationArea = All;
                }
                field("Desc. Curso"; Rec."Desc. Curso")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    MultiLine = true;
                }
                field("Num horas"; Rec."Num horas")
                {
                    ApplicationArea = All;
                }
            }
            group(Información)
            {
                Caption = 'Información';
                
                field("Departamento"; Rec."Departamento")
                {
                    ApplicationArea = All;
                    
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Departamento: Record Departamentos;
                    begin
                        if Page.RunModal(Page::"DepartamentosList", Departamento) = Action::LookupOK then begin
                            Rec.Validate("Departamento", Departamento."Código");
                        end;
                    end;

                    trigger OnDrillDown()
                    var
                        Departamento: Record Departamentos;
                        DepartamentoCard: Page "DepartamentosCard";
                    begin
                        if Departamento.Get(Rec."Departamento") then begin
                            DepartamentoCard.SetRecord(Departamento);
                            DepartamentoCard.Run();
                        end;
                    end;
                }
                field("Edificio Departamento"; Rec."Edificio Departamento")
                {
                    ApplicationArea = All;
                }
                field("Delegado Departamento"; Rec."Delegado Departamento")
                {
                    ApplicationArea = All;
                }
            }
            part(Clases; "CursosClasesListPart")
            {
                ApplicationArea = All;
                Caption = 'Clases';
                SubPageLink = "Código curso" = field("Código");
            }
        }
    }
}
