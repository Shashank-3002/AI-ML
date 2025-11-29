import plotly.express as px
df=px.data.gapminder().query("year==2007").query("continent=='Asia'")
df.loc[df['pop']>7e6,'country']='Other countries'

fig=px.pie(df,names='country',values='pop',title='Population of European continent in 2007')
fig.show()