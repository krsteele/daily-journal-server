import sqlite3
import json
from models import Entry
from models import Mood

def get_all_entries():
    # Open a connection to the database
    with sqlite3.connect("./dailyjournal.db") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            e.id,
            e.concept,
            e.date,
            e.entry,
            e.mood_id,
            m.mood
        FROM Entries e
        JOIN Moods m
            ON m.id = e.mood_id
        """)

        # Initialize an empty list to hold all entry representations
        entries = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset: 
            # Create an entry instance from the current row.
            entry = Entry(row['id'], row['concept'], row['date'], row['entry'], row['mood_id'])

            # Create mood instance fromt he current row
            mood = Mood(row['mood'])

            #Add the dictionary representation of the mood to the entry
            entry.mood = mood.__dict__

            # add the current entry instance to the entries list
            entries.append(entry.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(entries)


def get_single_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            e.id,
            e.concept,
            e.date,
            e.entry,
            e.mood_id,
            m.mood
        FROM Entries e
        JOIN Moods m
            ON m.id = e.mood_id
        WHERE e.id = ?
        """, (id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        entry = Entry(data['id'], data['concept'], data['date'], data['entry'], data['mood_id'])

        mood = Mood(data['mood'])

        #Add the dictionary representation of the mood to the entry
        entry.mood = mood.__dict__

        return json.dumps(entry.__dict__)


def delete_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM Entries
        WHERE id = ?
        """, (id, ))