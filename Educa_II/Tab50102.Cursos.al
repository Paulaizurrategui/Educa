table 50102 "Cursos"
{
    DataClassification = CustomerContent;
    Caption = 'Cursos';

    fields
    {
        field(1; "Código"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código';
        }
        field(2; "Nombre curso"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nombre curso';
        }
        field(3; "Edificio"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Edificio';
        }
        field(4; "Desc. Curso"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Desc. Curso';
        }
        field(5; "Num horas"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Num horas';
        }
        field(6; "Departamento"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Departamento';
            TableRelation = Departamentos."Código";
        }
        // Campos calculados para lookup
        field(10; "Edificio Departamento"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Departamentos.Edificio where("Código" = field(Departamento)));
            Caption = 'Edificio Departamento';
            Editable = false;
        }
        field(11; "Delegado Departamento"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Departamentos.Delegado where("Código" = field(Departamento)));
            Caption = 'Delegado Departamento';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Código")
        {
            Clustered = true;
        }
    }
}
