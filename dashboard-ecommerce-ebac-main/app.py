import pandas as pd
import dash
from dash import dcc, html
import plotly.express as px
import plotly.figure_factory as ff

# --- Carregar os dados ---
df = pd.read_csv("ecommerce_estatistica.csv")

# --- Criar a aplicação ---
app = dash.Dash(__name__)

# --- Gráficos ---
fig_hist = px.histogram(df, x="Preço", nbins=20, title="Distribuição de Preços")
fig_scatter = px.scatter(df, x="Preço", y="N_Avaliações", title="Preço vs Nº Avaliações")
fig_heatmap = px.imshow(df.corr(numeric_only=True), text_auto=True, aspect="auto", title="Mapa de Calor")
fig_bar = px.bar(df.groupby("Gênero")["Preço"].mean().reset_index(),
                 x="Gênero", y="Preço", title="Preço Médio por Gênero")
fig_pie = px.pie(df, names="Temporada", title="Distribuição por Temporada")
fig_density = ff.create_distplot([df["Preço"].dropna()], ["Preço"], show_hist=False)
fig_density.update_layout(title="Distribuição de Densidade - Preço")
fig_reg = px.scatter(df, x="Desconto", y="Qtd_Vendidos_Cod", trendline="ols",
                     title="Desconto vs Quantidade Vendida")

# --- Layout ---
app.layout = html.Div([
    html.H1("📊 Dashboard Ecommerce EBAC", style={"textAlign": "center"}),

    dcc.Graph(figure=fig_hist),
    dcc.Graph(figure=fig_scatter),
    dcc.Graph(figure=fig_heatmap),
    dcc.Graph(figure=fig_bar),
    dcc.Graph(figure=fig_pie),
    dcc.Graph(figure=fig_density),
    dcc.Graph(figure=fig_reg),
])

server = app.server  

if __name__ == "__main__":
    app.run_server(debug=True)
