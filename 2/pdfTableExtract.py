import tabula
import pandas as pd
import os
import zipfile

# Definir o caminho do arquivo PDF e o nome do arquivo CSV de saída
pdf_path = "./Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
output_csv = "./output.csv"
cleaned_csv = os.path.splitext(pdf_path)[0] + ".csv"

# Extrair tabelas do PDF para CSV
tabula.convert_into(
    pdf_path,
    output_csv,
    pages="3-181",
    output_format="csv",
    relative_area=True,
    area=[10, 0, 90, 100],
    lattice=True,
)

# Remover cabeçalhos repetido
df = pd.read_csv(output_csv)
df_cleaned = df[df["PROCEDIMENTO"] != "PROCEDIMENTO"].copy()


# Renomear colunas abreviadas
column_mapping = {
    "OD": "Seg. Odontológica",
    "AMB": "Seg. Ambulatorial",
    "HCO": "Seg. Hospitalar Com Obstetrícia",
    "HSO": "Seg. Hospitalar Sem Obstetrícia",
    "REF": "Plano Referência",
    "PAC": "Procedimento de Alta Complexidade",
    "DUT": "Diretriz de Utilização",
}
df_cleaned.rename(columns=column_mapping, inplace=True)
df_cleaned.to_csv(cleaned_csv, index=False)

# Remover o arquivo CSV original
if os.path.exists(output_csv):
    os.remove(output_csv)

# Compactar o arquivo CSV limpo em um arquivo ZIP
zip_filename = "./Teste_Bruno_Pergentino.zip"
with zipfile.ZipFile(zip_filename, "w", zipfile.ZIP_DEFLATED) as zipf:
    zipf.write(cleaned_csv, os.path.basename(cleaned_csv))

# Remover o arquivo CSV limpo após compactação
if os.path.exists(cleaned_csv):
    os.remove(cleaned_csv)

print(f"CSV compactado em: '{zip_filename}'.")
