import json
import requests
import typer

app = typer.Typer()

@app.command()
def main():
    with open('data/people.json', encoding='utf-8') as f:
        people = json.loads(f.read())

    for person in people:
        r = requests.post('http://127.0.0.1:5000/person/new', json = person)
        print(f"Created person {person['first_name']} {person['last_name']} with ID {r.text}")


if __name__ == "__main__":
    app()