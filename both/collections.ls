root = exports ? @

# FS.debug = true

# imageStore = new FS.Store.GridFS 'images'
imageStore = new FS.Store.FileSystem("images", {path: "./../../../../../uploads"})

root.Images = new FS.Collection 'images', { stores: [imageStore] }

# Images 用于存放图片

#-------------------------------------------------

root.Votes = new Mongo.Collection 'votes'

# Votes中的document的格式
# {
#   title: string (代表投票的标题)
#   initiator: string (引用自UserInfo中的username，代表投票的发起者)
#   category: string (从已定义的类别中选择，代表投票的类别)
#   status: open or close (代表投票的状态，只有在open时才能进行投票，status 可由发起者进行修改)
#   modifyDate: Date (最后一次修改的日期)
#   firstUrl: string (第一张图票的url)
#   secondUrl: string
#   firstImaegId: string
#   secondImageId: string
#   firstDescription: string (第一张图片的描述)
#   secondDescription: string
#   question: string (最小长度为15，代表用户提出的问题)
#   numOfFirst: int (代表选择第一张图的票数)
#   numOfSecond: int (代表选择第二张图的票数)
#
#   statisticsOfFirst: {
#     gender: [] (数组，长度为2，数组元素为int，两个元素分别代表投票的男性数量和女性数量,当元素为undefined时当成0)
#     age: [] (数组，长度为9，数组元素为int，其元素分别代表投票的不同年龄段（10 ~ 20, 21 ~ 30, ..., 91 ~ 100）的数量,当元素为undefined时当成0)
#     occupation: [] (数组，长度为已定义的职业数目总和，其元素分别代表投票的不同职业的数量,当元素为undefined时当成0)
#   } (对象，代表第一张图片的投票统计数据)
#
#   statisticsOfSecond: {
#     gender: []
#     age: []
#     occupation: []
#   } (对象，代表第二张图片的投票统计数据)
# }

#-------------------------------------------------

root.Comments = new Mongo.Collection 'comments'

# Comments中的document的格式
# {
#   voteId: string (投票项目的id)
#   username: string (发起该投票的用户)
#   content: string(评论内容)
# }

#-------------------------------------------------

root.Ballots = new Mongo.Collection 'ballots'

# Ballots中的document的格式
# {
#   voteId: string (投票项目的id)
#   choice: first or second (选择第一张图片还是第二张图片)
#   username: string (发起该投票的用户的用户名)
# }

#-------------------------------------------------

root.Follow = new Mongo.Collection 'follow'

# Follow中的document的格式
# {
#   username: string (被关注的用户的用户名)
#   follower: [] (关注者的用户名)
# }
