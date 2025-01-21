from flask import Flask, render_template, request, redirect, url_for, flash
from mysql import connector
import json

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'

db = connector.connect(
    host='cwen9.h.filess.io',
    user='dbsteam_sweptrose',
    password='32ec40aa3d079384fe27a8a56da7e9b9862fd011',
    database='dbsteam_sweptrose',
    port=3307
)

if db.is_connected():
    print('Successfully connected to the database')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/product')
def product():
    return render_template('product.html')

@app.route('/sales')
def sales():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT id, game, highest_discount AS highest_discount, start, end, discount_price FROM sales")
    sales = cursor.fetchall()

    print(f"Sales: {sales}")
    cursor.execute("SELECT id, franchise_name, bundle_name, games, bundle_price, start, end FROM bundles")
    bundles = cursor.fetchall()
    
    print(f"Bundles: {bundles}")
    cursor.close()
    return render_template('sales.html', sales=sales, bundles=bundles)

@app.route('/sales/add', methods=['GET', 'POST'])
def add_sales():
    if request.method == 'POST':
        game = request.form['game']
        event = request.form['highest_discount']
        start = request.form['start']
        end = request.form['end']
        price = request.form['discount_price']
        
        cursor = db.cursor()
        query = "INSERT INTO sales (game, highest_discount, start, end, discount_price) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(query, (game, event, start, end, price))
        db.commit()
        cursor.close()
        flash('Sales added successfully!', 'success')
        return redirect(url_for('sales'))
    
    return render_template('add_sales.html')

@app.route('/sales/edit/<int:id>', methods=['GET', 'POST'])
def edit_sales(id):
    cursor = db.cursor(dictionary=True)
    
    if request.method == 'POST':
        game = request.form['game']
        event = request.form['highest_discount']
        start = request.form['start']
        end = request.form['end']
        price = request.form['discount_price']
        
        query = """
            UPDATE sales 
            SET game=%s, highest_discount=%s, start=%s, end=%s, discount_price=%s 
            WHERE id=%s
        """
        cursor.execute(query, (game, event, start, end, price, id))
        db.commit()
        cursor.close()
        flash('Sales updated successfully!', 'success')
        return redirect(url_for('sales'))
    
    query = "SELECT * FROM sales WHERE id=%s"
    cursor.execute(query, (id,))
    sales = cursor.fetchone()
    cursor.close()
    return render_template('edit_sales.html', sales=sales)

@app.route('/sales/delete/<int:id>', methods=['POST'])
def delete_sales(id):
    cursor = db.cursor()
    query = "DELETE FROM sales WHERE id=%s"
    cursor.execute(query, (id,))
    db.commit()
    cursor.close()
    flash('Sales deleted successfully!', 'success')
    return redirect(url_for('sales'))

@app.route('/bundles/add', methods=['GET', 'POST'])
def add_bundles():
    if request.method == 'POST':
        franchise_name = request.form['franchise_name']
        bundle_name = request.form['bundle_name']
        games = request.form['games']  # Data game yang dikirim dalam format JSON
        bundle_price = request.form['bundle_price']
        start = request.form['start']
        end = request.form['end']
        
        # Mengonversi string JSON menjadi list
        games_list = json.loads(games)
        
        cursor = db.cursor()
        query = """
            INSERT INTO bundles (franchise_name, bundle_name, games, bundle_price, start, end)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (franchise_name, bundle_name, ', '.join(games_list), bundle_price, start, end))
        db.commit()
        cursor.close()
        flash('Bundle added successfully!', 'success')
        return redirect(url_for('sales'))
    
    return render_template('add_bundles.html')

@app.route('/bundles/edit/<int:id>', methods=['GET', 'POST'])
def edit_bundles(id):
    cursor = db.cursor(dictionary=True)
    
    if request.method == 'POST':
        franchise_name = request.form['franchise_name']
        bundle_name = request.form['bundle_name']
        games = request.form['games']  # Data game yang dikirim dalam format JSON
        bundle_price = request.form['bundle_price']
        start = request.form['start']
        end = request.form['end']
        
        # Mengonversi string JSON menjadi list
        games_list = json.loads(games)
        
        query = """
            UPDATE bundles 
            SET franchise_name=%s, bundle_name=%s, games=%s, bundle_price=%s, start=%s, end=%s
            WHERE id=%s
        """
        cursor.execute(query, (franchise_name, bundle_name, ', '.join(games_list), bundle_price, start, end, id))
        db.commit()
        cursor.close()
        flash('Bundle updated successfully!', 'success')
        return redirect(url_for('sales'))
    
    query = "SELECT * FROM bundles WHERE id=%s"
    cursor.execute(query, (id,))
    bundle = cursor.fetchone()
    cursor.close()
    return render_template('edit_bundles.html', bundle=bundle)

@app.route('/bundles/delete/<int:id>', methods=['POST'])
def delete_bundles(id):
    cursor = db.cursor()
    query = "DELETE FROM bundles WHERE id=%s"
    cursor.execute(query, (id,))
    db.commit()
    cursor.close()
    flash('Bundle deleted successfully!', 'success')
    return redirect(url_for('sales'))

@app.route('/other')
def other():
    return render_template('other.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

if __name__ == '__main__':
    app.run(debug=True)
