apiKey = '' # put your api key here

region = 'euw'

command: "curl -s 'http://status.leagueoflegends.com/shards/#{region}'"

refreshFrequency: 600000

style: """
  top: 25px
  left: 200px
  color: #fff
  font-family: Helvetica Neue

  div
    display: block
    border: 1px solid #fff
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#fff, 0.1)
    font-size: 24px
    font-weight: 100
    padding: 4px 6px 4px 6px

    &:after
      content: 'Server Status'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500

"""


render: (output) -> """
  <div class='server-status'></div>
"""

update: (output, domEl) ->
  data  = JSON.parse(output)

  $(domEl).find('.server-status').html(data.services[1].status)
