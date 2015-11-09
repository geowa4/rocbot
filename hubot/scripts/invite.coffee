# Description:
#   Invites people to this Slack team.
#
# Dependencies:
#
# Configuration:
#   SLACK_URL
#   SLACK_API_TOKEN
#
# Commands:
#   hubot invite <email> - Invites the given email address to this team.
#
# Author:
#   geowa4

module.exports = (robot) ->
  robot.enter (res) ->
    res.send 'How may I serve you?'

  robot.respond /invite (.*@.*\..*)/, (res) ->
    email = res.match[1]
    res.send "As you wish, I will invite #{email} immediately."
    api_base = process.env.SLACK_URL
    data = JSON.stringify
      email: email
      token: process.env.SLACK_API_TOKEN
      set_active: true
    res.http("#{api_base}/api/users.admin.invite")
      .post(data) (err, resp, body) ->
        if err
          res.send "I'm so sorry. I have failed to invite #{email}."
        else
          res.send "The invitation to #{email} has been sent."
