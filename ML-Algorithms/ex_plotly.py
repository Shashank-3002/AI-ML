from dash import Dash, html, dcc, Input, Output
import plotly.express as px

app = Dash(__name__)

app.layout = html.Div([
    html.H4("Iris Example"),
    
    dcc.Dropdown(
        id='dropdown',
        options=[
            {'label': 'sepal_width', 'value': 'sepal_width'},
            {'label': 'sepal_length', 'value': 'sepal_length'},
            {'label': 'petal_width', 'value': 'petal_width'},
            {'label': 'petal_length', 'value': 'petal_length'},
        ],
        value=['sepal_length', 'sepal_width'],  # default selected
        multi=True
    ),

    dcc.Graph(id='graph'),
])


@app.callback(
    Output('graph', 'figure'),
    Input('dropdown', 'value')
)
def update_bar_chart(dims):
    df = px.data.iris()
    fig = px.scatter_matrix(
        df,
        dimensions=dims,
        color='species'
    )
    return fig


if __name__ == "__main__":
    app.run_server(debug=True)