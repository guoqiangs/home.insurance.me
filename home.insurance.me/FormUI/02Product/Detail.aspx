<%@ Page Title="" Language="C#" MasterPageFile="~/FormUI/Shared/Main.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="home.insurance.cn.FormUI._02Product.Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="product1" style="display: none">
        <div class="j-product-wrap">
            <ul class="j-product clearfix">
                <div class="j-product-image">
                    <img src="http://local.testxdf.cn/insurance.me/Scripts/public/images/product/pic01.jpg">
                </div>
                <div class="j-product-details">
                    <h4>E保交通工具综合保险（贴心保）</h4>
                    <p>携手人保财险重磅推出（全球保障）</p>
                    <span class="detail01">承保年龄： 0-75周岁</span>
                    <span class="detail02">保障期限：1年</span>
                    <span class="detail03">限购份数：3份</span>
                    <div class="buy">
                        <a href="http://local.testxdf.cn/insurance.me/FormUI/04Order/edit.aspx?productid=1">立即投保</a>
                        <p>价格：<i>¥19.90</i></p>
                    </div>
                </div>
            </ul>
        </div>
        <div class="wrap">
            <ul class="f-tab clearfix js-tab">
                <li class="current" data-flag="1"><a href="javascript:;">保障利益</a></li>
                <li data-flag="1"><a href="javascript:;">温馨提示</a></li>
                <li data-flag="1"><a href="javascript:;">保险条款</a></li>
                <li data-flag="1"><a href="javascript:;">投保须知</a></li>
                <li data-flag="1"><a href="javascript:;">理赔指南</a></li>
            </ul>
            <div class="f-tabContent">
                <div class="B-ui-table-ext02">
                    <div style="line-height: 30px;">交通工具意外（PICC）</div>
                    <table class="B-ui-table B-ui-table-fixed">
                        <tbody>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">地铁、火车、轻轨</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
        害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">公交车、出租车、长途汽车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">300,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
        害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">自驾车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">300,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
        害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">轮船、渡船、邮轮</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
        害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>1、综合交通意外意外险保额高达300万元，范围覆盖飞机/公交车/出租车/自驾车/地铁/火车/长途客车、轮船等所有交通工具。</p>
                    <p>2、一次购买全年无忧，适合有部分航空旅行或出差的人士。</p>
                    <p>3、每一被保险人最多购买3份，保障累加。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>人保（备案）［2009］N542号－交通工具乘客意外伤害保险条款&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                    <p>人身保险伤残评定标准及代码&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>投保须知</p>
                    <p>1、投保前请仔细阅读保险条款，尤其是“责任免除”部分，防止理赔时出现保险公司拒赔情况。</p>
                    <p>2、本产品承保75周岁以下，具备完全民事行为的被保险人</p>
                    <p>3、本产品生效时间可自主安排，最早为网上投保成功后的次日零时。 </p>
                    <p>4、本产品每一被保险人同一保险期间限投保三份，多投无效。</p>
                    <p>5、本产品承保区域涵盖境内外，但如下地区不承保。</p>
                    <p>亚洲：阿富汗、伊拉克、东帝汶民主共和国；</p>
                    <p>非洲：布隆迪、中非共和国、乍得、刚果民主共和国、厄立特里亚、几内亚、索马里、苏丹、利比里亚、科特迪瓦共和国；</p>
                    <p>大洋洲：Bouvet Island、Heard and Macdonald、南乔治亚和南桑威治、所罗门群岛；</p>
                    <p>美洲：海地；</p>
                    <p>南极洲：南极洲。</p>
                    <p>除以上地区外，战乱、政变、政局动荡国家和地区不承保。</p>
                    <p>6、投保时，投保人有义务将该保险产品的保障内容、保险金额、责任免除条款等向被保险人进行明确说明，并征得被保险人</p>
                    同意，方可投保；父母为其未成年子女投保不受此限。
            <p>7、本产品由中国人民财产保险股份有限公司承保，您通过E保管家购买的保险产品，后续变更与理赔事务均可由E保管家协</p>
                    助您办理。
            <p>8、人保财险产品一经核保后，不办理任何形式的信息变更，请仔细填写投保信息。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>理赔指南</p>
                    <p>一、保险理赔所需步骤</p>
                    <p>1.出险报案：出险之后请立即拨打人保财险24小时服务报案热线95518。</p>
                    <p>2.案件处理：理赔人员根据案件情况提供专业的指导和服务。</p>
                    <p>3.行使索赔权：您把约定的理赔资料提交到我们的理赔服务网点。我们会严格按照合同履行赔付义务。</p>
                    <p>4.核对赔款：请您在接到付款通知后，查询赔款到账情况，如有疑问随时拨打95518。</p>
                    <p>二、PICC意外伤害保险理赔办理所需文档</p>
                    <p>1. 提供保险信息（保险单原件、复印件、保单号）；；</p>
                    <p>2. 索赔申请人需提供受益人的授权委托书；</p>
                    <p>3. 索赔申请人的户籍证明或者身份证明；</p>
                    <p>4. 受益人的身份证明、与死者的关系证明；</p>
                    <p>5. 证明文件：</p>
                    <p>（1）事故证明；</p>
                    <p>（2）残疾、烧伤保险金索赔时请提供我公司指定或认可的医疗机构、司法机关或其他鉴定机构出具的残疾、烧伤程度证明；</p>
                    <p>（3）身故保险金索赔时请提供死亡证明及户口注销证明，或法院宣告死亡判决书。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
        </div>
    </div>

    <div id="product2" style="display: none">


        <div class="j-product-wrap">
            <ul class="j-product clearfix">
                <div class="j-product-image">
                    <img src="http://local.testxdf.cn/insurance.me/Scripts/public/images/product/pic02.jpg">
                </div>
                <div class="j-product-details">
                    <h4>E保意外伤害综合保险B计划</h4>
                    <p>携手人保财险重磅推出（全球保障）</p>
                    <span class="detail01">承保年龄： 0-75周岁</span>
                    <span class="detail02">保障期限：1年</span>
                    <span class="detail03">限购份数：3份</span>
                    <div class="buy">
                        <a href="http://local.testxdf.cn/insurance.me/FormUI/04Order/edit.aspx?productid=2">立即投保</a>
                        <p>价格：<i>¥66.00</i></p>
                    </div>
                </div>
            </ul>
        </div>
        <div class="wrap">
            <ul class="f-tab clearfix js-tab">
                <li class="current" data-flag="2"><a href="javascript:;">保障利益</a></li>
                <li data-flag="2"><a href="javascript:;">温馨提示</a></li>
                <li data-flag="2"><a href="javascript:;">保险条款</a></li>
                <li data-flag="2"><a href="javascript:;">投保须知</a></li>
                <li data-flag="2"><a href="javascript:;">理赔指南</a></l>
            </ul>
            <div class="f-tabContent">
                <div class="B-ui-table-ext02">
                    <div style="line-height: 30px;">交通工具意外（PICC）</div>
                    <table class="B-ui-table B-ui-table-fixed">
                        <tbody>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">飞机</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">100,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">地铁、火车、轻轨</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">公交车、出租车、长途汽车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">300,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐公交车、出租车、长途汽车期间遭受
因意外伤害导致身故或残疾的，我们将按"汽车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">自驾车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">300,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐自驾车期间遭受因意外伤害导致身故
或残疾的，我们将按"汽车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">轮船、渡船、邮轮</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐轮船、渡船、邮轮期间遭受因意外伤
害导致身故或残疾的，我们将按"轮船意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>1、综合交通意外意外险保额高达160万元，范围覆盖公交车/出租车/自驾车/地铁/火车/长途客车、轮船等所有交通工具；适用于都市上班族。</p>
                    <p>2、每一被保险人可同时购买3份，升级保障。 </p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>人保（备案）［2009］N542号－交通工具乘客意外伤害保险条款&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                    <p>人身保险伤残评定标准及代码&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>投保须知</p>
                    <p>1、投保前请仔细阅读保险条款，尤其是“责任免除”部分，防止理赔时出现保险公司拒赔情况。</p>
                    <p>2、本产品承保75周岁以下，具备完全民事行为的被保险人</p>
                    <p>3、本产品生效时间可自主安排，最早为网上投保成功后的次日零时。 </p>
                    <p>4、本产品每一被保险人同一保险期间限投保三份，多投无效。</p>
                    <p>5、本产品承保区域涵盖境内外，但如下地区不承保。</p>
                    <p>亚洲：阿富汗、伊拉克、东帝汶民主共和国；</p>
                    <p>非洲：布隆迪、中非共和国、乍得、刚果民主共和国、厄立特里亚、几内亚、索马里、苏丹、利比里亚、科特迪瓦共和国；</p>
                    <p>大洋洲：Bouvet Island、Heard and Macdonald、南乔治亚和南桑威治、所罗门群岛；</p>
                    <p>美洲：海地；</p>
                    <p>南极洲：南极洲。</p>
                    <p>除以上地区外，战乱、政变、政局动荡国家和地区不承保。</p>
                    <p>6、投保时，投保人有义务将该保险产品的保障内容、保险金额、责任免除条款等向被保险人进行明确说明，并征得被保险人</p>
                    同意，方可投
            <p>保；父母为其未成年子女投保不受此限。</p>
                    <p>7、本产品由中国人民财产保险股份有限公司承保，您通过E保管家购买的保险产品，后续变更与理赔事务均可由E保管家协</p>
                    助您办理。
            <p>8、人保财险产品一经核保起保后，不办理任何形式的信息变更，请仔细填写投保信息。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>理赔指南</p>
                    <p>一、保险理赔所需步骤</p>
                    <p>1.出险报案：出险之后请立即拨打人保财险24小时服务报案热线95518。</p>
                    <p>2.案件处理：理赔人员根据案件情况提供专业的指导和服务。</p>
                    <p>3.行使索赔权：您把约定的理赔资料提交到我们的理赔服务网点。我们会严格按照合同履行赔付义务。</p>
                    <p>4.核对赔款：请您在接到付款通知后，查询赔款到账情况，如有疑问随时拨打95518。</p>
                    <p>二、PICC意外伤害保险理赔办理所需文档</p>
                    <p>1. 提供保险信息（保险单原件、复印件、保单号）；；</p>
                    <p>2. 索赔申请人需提供受益人的授权委托书；</p>
                    <p>3. 索赔申请人的户籍证明或者身份证明；</p>
                    <p>4. 受益人的身份证明、与死者的关系证明；</p>
                    <p>5. 证明文件：</p>
                    <p>（1）事故证明；</p>
                    <p>（2）残疾、烧伤保险金索赔时请提供我公司指定或认可的医疗机构、司法机关或其他鉴定机构出具的残疾、烧伤程度证明；</p>
                    <p>（3）身故保险金索赔时请提供死亡证明及户口注销证明，或法院宣告死亡判决书。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
        </div>
    </div>

    <div id="product3" style="display: none">


        <div class="j-product-wrap">
            <ul class="j-product clearfix">
                <div class="j-product-image">
                    <img src="http://local.testxdf.cn/insurance.me/Scripts/public/images/product/pic03.jpg">
                </div>
                <div class="j-product-details">
                    <h4>E保意外伤害综合保险C计划</h4>
                    <p>携手人保财险重磅推出（全球保障）</p>
                    <span class="detail01">承保年龄：10-65周岁</span>
                    <span class="detail02">保障期限：1年</span>
                    <span class="detail03">限购份数：3份</span>
                    <div class="buy">
                        <a href="http://local.testxdf.cn/insurance.me/FormUI/04Order/edit.aspx?productid=3">立即投保</a>
                        <p>价格：<i>¥99.00</i></p>
                    </div>
                </div>
            </ul>
        </div>
        <div class="wrap">
            <ul class="f-tab clearfix js-tab">
                <li class="current" data-flag="3"><a href="javascript:;">保障利益</a></li>
                <li data-flag="3"><a href="javascript:;">温馨提示</a></li>
                <li data-flag="3"><a href="javascript:;">保险条款</a></li>
                <li data-flag="3"><a href="javascript:;">投保须知</a></li>
                <li data-flag="3"><a href="javascript:;">理赔指南</a></li>
            </ul>
            <div class="f-tabContent">
                <div class="B-ui-table-ext02">
                    <div style="line-height: 30px;">交通工具意外（PICC）</div>
                    <table class="B-ui-table B-ui-table-fixed">
                        <tbody>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">飞机</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">200,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">地铁、火车、轻轨</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">600,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐地铁、火车、轻轨期间遭受因意外伤
害导致身故或残疾的，我们将按"火车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">公交车、出租车、长途汽车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐公交车、出租车、长途汽车期间遭受
因意外伤害导致身故或残疾的，我们将按"汽车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">自驾车</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">500,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐自驾车期间遭受因意外伤害导致身故
或残疾的，我们将按"汽车意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">轮船、渡船、邮轮</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">600,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">
                                        在保险期间内，被保险人在全球范围内乘坐轮船、渡船、邮轮期间遭受因意外伤
害导致身故或残疾的，我们将按"轮船意外伤害保险金额"给付保险金。
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="line-height: 30px;">意外伤害</div>
                    <table class="B-ui-table B-ui-table-fixed">
                        <tbody>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">意外医疗</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">5,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">1.因遭受意外伤害，在二级或二级以上医院或保险公司认可的医疗机构进行治疗，保险公司将根据合同约定给付医疗保险金。2.意外医疗费用每次事故扣除100元后，超出部分按90%比例报销。</div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%; text-align: center;">
                                    <div class="B-ui-table-ext">意外伤害</div>
                                </td>
                                <td style="width: 20%; text-align: center;">
                                    <div class="B-ui-table-ext">30,000.00元</div>
                                </td>
                                <td>
                                    <div class="B-ui-table-ext">因意外伤害导致身故或残疾，我们将根据合同约定给付医疗保险金。</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>1、综合保障因意外伤害导致身故或残疾30000元、意外医疗5000元。 </p>
                    <p>2、综合交通意外意外险保额高达420万元，范围覆盖飞机/公交车/出租车/自驾车/地铁/火车/</p>
                    长途客车、轮船等所有交通工具。
            <p>3、一次购买全年无忧，尤其适合经常出差的空中飞人。</p>
                    <p>4、每一被保险人可同时购买3份，升级保障。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>人保（备案）［2009］N508号－意外伤害保险条款（2009版）&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                    <p>人保（备案）［2009］N512号－附加意外伤害医疗保险条款（2009版）&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                    <p>人保（备案）［2009］N542号－交通工具乘客意外伤害保险条款（2009版）&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                    <p>人身保险伤残评定标准及代码&nbsp;&nbsp;<a href="#">点击下载pdf&gt;&gt;</a></p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>投保须知</p>
                    <p>1、投保前请仔细阅读保险条款，尤其是“责任免除”部分，防止理赔时出现保险公司拒赔情况。</p>
                    <p>2、本产品承保65周岁以下，具备完全民事行为的被保险人</p>
                    <p>3、本产品生效时间可自主安排，最早为网上投保成功后的次日零时。 </p>
                    <p>4、本产品每一被保险人同一保险期间限投保三份，多投无效。</p>
                    <p>5、本产品承保区域涵盖境内外，但如下地区不承保。</p>
                    <p>亚洲：阿富汗、伊拉克、东帝汶民主共和国；</p>
                    <p>非洲：布隆迪、中非共和国、乍得、刚果民主共和国、厄立特里亚、几内亚、索马里、苏丹、利比里亚、科特迪瓦共和国；</p>
                    <p>大洋洲：Bouvet Island、Heard and Macdonald、南乔治亚和南桑威治、所罗门群岛；</p>
                    <p>美洲：海地；</p>
                    <p>南极洲：南极洲。</p>
                    <p>除以上地区外，战乱、政变、政局动荡国家和地区不承保。</p>
                    <p>6、投保时，投保人有义务将该保险产品的保障内容、保险金额、责任免除条款等向被保险人进行明确说明，并征得被保险人</p>
                    同意，方可投保；
            <p>父母为其未成年子女投保不受此限。</p>
                    <p>7、本产品由中国人民财产保险股份有限公司承保，您通过E保管家购买的保险产品，后续变更与理赔事务均可由E保管家协</p>
                    助您办理。
            <p>8、人保财险产品一经核保后，不办理任何形式的信息变更，请仔细填写投保信息。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
            <div class="f-tabContent" style="display: none;">
                <div class="f-tabContent-list01">
                    <p>理赔指南</p>
                    <p>一、保险理赔所需步骤</p>
                    <p>1.出险报案：出险之后请立即拨打人保财险24小时服务报案热线95518。</p>
                    <p>2.案件处理：理赔人员根据案件情况提供专业的指导和服务。</p>
                    <p>3.行使索赔权：您把约定的理赔资料提交到我们的理赔服务网点。我们会严格按照合同履行赔付义务。</p>
                    <p>4.核对赔款：请您在接到付款通知后，查询赔款到账情况，如有疑问随时拨打95518。</p>
                    <p>二、PICC意外伤害保险理赔办理所需文档</p>
                    <p>1. 提供保险单信息（保险单原件、复印件、保单号）；</p>
                    <p>2. 索赔申请人需提供受益人的授权委托书；</p>
                    <p>3. 索赔申请人的户籍证明或者身份证明；</p>
                    <p>4. 受益人的身份证明、与死者的关系证明；</p>
                    <p>5. 证明文件：</p>
                    <p>（1）事故证明；</p>
                    <p>（2）残疾、烧伤保险金索赔时请提供我公司指定或认可的医疗机构、司法机关或其他鉴定机构出具的残疾、烧伤程度证明；</p>
                    <p>（3）身故保险金索赔时请提供死亡证明及户口注销证明，或法院宣告死亡判决书；</p>
                    <p>（4）医疗费用索赔时请提供病历、诊断证明、住院证明、医疗费用清单、医疗费用收据原件或医疗费用分割单等。</p>
                </div>
            </div>
            <!-- f-tabContent end -->
        </div>
    </div>


    <script type="text/javascript">


        $(document).ready(function () {
            var id = getQueryString("id");
            
            if (id == 1) {
                $("#product1").show();
            }
            else if (id == 2) {
                $("#product2").show();
            }
            else {
                $("#product3").show();
            }
        });


        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);

            return null;
        }

    </script>
</asp:Content>
