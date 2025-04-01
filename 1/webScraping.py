import urllib.request
import re
import os
import zipfile
import os

# Ensure the script's directory is used for all file operations
script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

# Teste de acesso ao site
try:
    response = urllib.request.urlopen(url)
    html = response.read().decode("utf-8")
    print("Acesso ao site bem-sucedido!")
except Exception as e:
    print(f"Erro ao acessar o site: {e}")
    exit()

# Regex para capturar links diretos de arquivos PDF que contenham "anexo" no nome
regex = r'https?://[^\s"]*anexo[^\s"]*\.pdf'

# Encontrar todos os links ignorando maiúsculas e minúsculas
matches = re.findall(regex, html, re.IGNORECASE)

# Remover duplicatas    
unique_links = list(set(matches))

# Baixar os arquivos na mesma pasta do script
print("\nBaixando arquivos...")
downloaded_files = []  # Array para armazenar os arquivos baixados epip install tabula pandas compactar posteriormente
for link in unique_links:
    file_name = os.path.join(os.getcwd(), link.split("/")[-1])
    try:
        urllib.request.urlretrieve(link, file_name)
        downloaded_files.append(file_name)
        print(f"Baixado: {file_name}")
    except Exception as e:
        print(f"Erro ao baixar {link}: {e}")

# Criar um arquivo ZIP com os PDFs baixados
zip_name = "./anexos.zip"
with zipfile.ZipFile(zip_name, 'w', zipfile.ZIP_DEFLATED) as zipf:
    for file in downloaded_files:
        zipf.write(file, os.path.basename(file))
        
# Remover os arquivos PDF após compactação
for file in downloaded_files:
    try:
        os.remove(file)
        print(f"Removido: {file}")
    except Exception as e:
        print(f"Erro ao remover {file}: {e}")

print(f"\nCompactação concluída! Arquivo salvo como: {zip_name}")