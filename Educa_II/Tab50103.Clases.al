table 50103 "Clases"
{
    DataClassification = CustomerContent;
    Caption = 'Clases';

    fields
    {
        field(1; "Código curso"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código curso';
            TableRelation = Cursos."Código";
        }
        field(2; "Día"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Día';
        }
        field(3; "Hora"; Time)
        {
            DataClassification = CustomerContent;
            Caption = 'Hora';
        }
        field(4; "Código profesor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Código profesor';
            TableRelation = Profesores."Código";
        }
        field(5; "Sección"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sección';
        }
        // Campos calculados para lookup
        field(10; "Nombre curso"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Cursos."Nombre curso" where("Código" = field("Código curso")));
            Caption = 'Nombre curso';
            Editable = false;
        }
        field(11; "Nombre profesor"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Profesores.Nombre where("Código" = field("Código profesor")));
            Caption = 'Nombre profesor';
            Editable = false;
        }
        field(20; "Nº Matrículas"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Matriculas where("Código curso" = field("Código curso"), "Sección" = field(Sección)));
            Caption = 'Nº Matrículas';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Código curso", "Sección")
        {
            Clustered = true;
        }
    }
}
