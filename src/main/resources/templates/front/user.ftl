<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=utf-8">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>-个人中心</title>
    <link rel="shortcut icon" href="${ctx!}/images/logo.png" type="image/x-icon">
    <!--Layui-->
    <link href="${ctx!}/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="${ctx!}/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="${ctx!}/css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="${ctx!}/css/user.css" rel="stylesheet" />
</head>
<body>
    <!-- 导航 -->
    <nav class="blog-nav layui-header">
        <div class="blog-container">
            <!-- 用户登陆 -->
            <div class="blog-user"></div>
			<a class="blog-logo" href="/">Moea教学管理系统</a>
            <!-- 导航菜单 -->
            <ul class="layui-nav" lay-filter="nav">
                <li class="layui-nav-item">
                    <a href="/"><i class="fa fa-home fa-fw"></i>&nbsp;算法简介</a>
                </li>

                <li class="layui-nav-item ">
                    <a href="/resource/index"><i class="fa fa-home fa-fw"></i>&nbsp;资源分享</a>
                </li>

                <li class="layui-nav-item">
                    <a href="/question/index"><i class="fa fa-home fa-fw"></i>&nbsp;在线留言</a>
                </li>

                <li class="layui-nav-item  layui-this">
                    <a href="/user/index"><i class="fa fa-tags fa-fw"></i>&nbsp;个人中心</a>
                </li>
            </ul>
            <!-- 手机和平板的导航开关 -->
            <a class="blog-navicon" href="javascript:;">
                <i class="fa fa-navicon"></i>
            </a>
        </div>
    </nav>
    <!-- 主体（一般只改变这里的内容） -->
    <div class="blog-body">
        <div class="blog-container">
        	<input id="token" type="hidden">
			<input id="uid" type="hidden">
            <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
                <a href="/" title="网站首页">网站首页</a>
                <a><cite>个人中心</cite></a>
            </blockquote>
            <div class="blog-main">
           		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
		    	<ul class="layui-tab-title">
		    		<li class="layui-this" id="myInfo">我的资料</li>
		    		<li>修改密码</li>
		    	</ul>
		    	<div class="layui-tab-content">
		    		<!-- 我的资料 -->
		    		<div class="layui-tab-item layui-show">
			    		<form class="layui-form layui-form-pane" method="post">
                            <div class="layui-form-item">
                                    <input type="hidden" name="id" id="id">
                            </div>
			    			<div class="layui-form-item">
						    	<label class="layui-form-label">帐号</label>
					    		<div class="layui-input-inline">
					        		<input id="num" type="text" name="num" required  lay-verify="number" autocomplete="off" class="layui-input">
					        	</div>
					    	</div>
					    	<div class="layui-form-item">
						    	<label class="layui-form-label">姓名</label>
					    		<div class="layui-input-inline">
					        		<input id="name" type="text" name="name" required  lay-verify="required" autocomplete="off" class="layui-input">
					        	</div>
				            	<div class="layui-input-inline">
						    		<input type="radio" name="sex" value="男" title="男">
						    		<input type="radio" name="sex" value="女" title="女">
						    	</div>
					    	</div>

					    	<div class="layui-form-item">
						    	<label class="layui-form-label">电话</label>
					    		<div class="layui-input-inline">
					        		<input id="phone" type="text" name="phone" autocomplete="off" class="layui-input">
					        	</div>
					    	</div>

							<div class="layui-form-item">
								<label class="layui-form-label">邮箱</label>
								<div class="layui-input-inline">
									<input id="email" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input" >
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">出生日期</label>
								<div class="layui-input-inline">
									<input id="birth" type="text" name="birth" autocomplete="off" class="layui-input">
								</div>
							</div>

					   		<div class="layui-form-item">
						   		<div class="layui-input-inline">
									<button class="layui-btn" lay-submit lay-filter="formInfo">确认修改</button>
								</div>
					   		</div>
						</form>
		    		</div>
    				<!-- 密码 -->
    				<div class="layui-tab-item">
    					<form class="layui-form layui-form-pane" method="post">
                            <input type="hidden" id="userId" name="id">
                            <div class="layui-form-item">
                                <label class="layui-form-label">旧密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="oldPassword" required  lay-verify="required" autocomplete="off" class="layui-input">
                                </div>

                            </div>
    						<div class="layui-form-item">
						    	<label class="layui-form-label">新密码</label>
					    		<div class="layui-input-inline">
					        		<input type="password" name="newPassword" required  lay-verify="required" autocomplete="off" class="layui-input">
					        	</div>
					        	<div class="layui-form-mid layui-word-aux">6到18个字符</div>
					   		</div>
					   		<div class="layui-form-item">
						    	<label class="layui-form-label">确认密码</label>
					    		<div class="layui-input-inline">
					        		<input type="password" name="rePassword" required  lay-verify="required" autocomplete="off" class="layui-input">
					        	</div>
					        <div class="layui-form-mid layui-word-aux"></div>
					    	</div>
					    	<div class="layui-form-item">
						   		<div class="layui-input-inline">
									<button class="layui-btn" lay-submit lay-filter="formPwd">确认修改</button>
								</div>
					   		</div>
    					</form>
    				</div>

    				<!-- END -->    
            	</div>
            </div>
           </div> 
          </div>
    </div>
    <!-- 底部 -->
	<footer class="blog-footer">
		<p><span>Copyright</span><span>&copy;</span><span>2019</span><a href="/">Moead</a></p>
	</footer>
    <!--遮罩-->
    <div class="blog-mask animated layui-hide"></div>
    <!-- layui.js -->
    <script src="${ctx!}/layui/layui.js"></script>
    <!-- 全局脚本 -->
    <script src="${ctx!}/js/global.js"></script>
    <script src="${ctx!}/js/canvas-particle.js"></script>
    <!-- 本页脚本 -->
    <script src="${ctx!}/js/user.js"></script>

</body>
</html>