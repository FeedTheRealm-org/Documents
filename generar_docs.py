import os
import yaml

CONFIG_FILE = "files.yaml"
GENERATOR_FILENAME = "{GENERATOR_FILENAME}"
GENERATOR_MODE = 0o755

class Document:
  def __init__(self, name, description, entrypoint):
    self.name = name
    self.description = description
    self.entrypoint = entrypoint
  
  def generate_file_for_pdf(self):
    with open(f"{self.entrypoint}/{GENERATOR_FILENAME}", "w") as generator_file:
      generator_file.write(f"#!/bin/bash\n\n")
      generator_file.write(f"cd {self.entrypoint}\n")
      generator_file.write(f"pdflatex -interaction=nonstopmode main.tex\n")
      generator_file.write(f"pdflatex -interaction=nonstopmode main.tex\n")
      generator_file.write(f"rm -f main.aux main.log main.out main.toc main.fls main.fdb_latexmk main.pyg\n")

  def run_generator(self):
    os.chmod(f"{self.entrypoint}/{GENERATOR_FILENAME}", GENERATOR_MODE)
    os.system(f"{self.entrypoint}/{GENERATOR_FILENAME}")

  def copy_pdf_to_root(self):
    pdf_path = f"{self.entrypoint}/main.pdf"
    dest_path = f"./{self.name}.pdf"
    if os.path.exists(pdf_path):
      os.system(f"cp {pdf_path} {dest_path}")
      os.system(f"rm -f {pdf_path}")

  def delete_generator_file(self):
    os.remove(f"{self.entrypoint}/{GENERATOR_FILENAME}")

if __name__ == "__main__":
  with open(CONFIG_FILE, "r") as config_file:
    config = yaml.safe_load(config_file)

  for files, config in config.items():
    doc = Document(config['name'], config['description'], config['entrypoint'])
    doc.generate_file_for_pdf()
    doc.run_generator()
    doc.copy_pdf_to_root()
    doc.delete_generator_file()
