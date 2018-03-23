from flask import Flask, render_template, request
app = Flask('PipelineTester')

@app.route('/', methods=['GET', 'POST'])
def submit():
    if request.method == 'POST':
        print(dir(request.form))
        print(request.form)

        if request.form['password1'] == request.form['password2']:
            return request.form['password1']
        else:
            error = 'password mismatch'
            return render_template('submit.html.j2', error=error)

    elif request.method == 'GET':
        return render_template('submit.html.j2')

