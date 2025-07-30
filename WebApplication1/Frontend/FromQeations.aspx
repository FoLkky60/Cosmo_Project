<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="FromQeations.aspx.vb" Inherits="WebApplication1.FromQeations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="d-flex justify-content-center">
        <div class="vw-75 overflow-auto">
            <div class="d-flex justify-content-center">
                <div class="d-flex flex-column justify-content-center">
                    <h3 class="d-flex justify-content-center">
                        <asp:Label Font-Bold="true" ForeColor="Blue" ID="lblCompany" runat="server"
                            Text="ชื่อสถานประกอบการ  " CssClass="text-black"></asp:Label>
                    </h3>
                    <h3 class="d-flex justify-content-center align-items-center p-4">TLS8001/Sa08000 - แบบสอบถามการประเมินตัวเอง
                        (ผู้ส่งมอบ/ผู้รับเหมาช่วง)</h3>
                    <div class="border border-secondary p-2 pt-5">
                        <asp:HiddenField ID="hdfTlsId" runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="hdfSupplierId" runat="server"></asp:HiddenField>
                        <div align="center" cellpadding="0" cellspacing="0" class="p-4" id="tblCustomers"
                            width="1024px">
                            <div class=" d-flex justify-content-between">
                                <div class="text-center w-50"><strong>รายการ</strong></div>

                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>1.ข้อกำหนดทั่วไป
                                        (ข้อกำหนด 4.1)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีเอกสารตามที่กฎหมายแรงงานกำหนด
                                    ได้แก่ข้อบังคับเกี่ยวกับการทำงาน ทะเบียนลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0101" ID="rbt_1" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0101" ID="rbt_2" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0101" ID="rbt_3" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_1" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>2.
                                        การบังคับใช้แรงงาน (ข้อกำหนด 4.3)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย/ประกาศ/ระเบียบ
                                    ห้ามมีการบังคับใช้แรงงานในทุกรูปแบบและไม่เข้าไปมีส่วนร่วมในการใช้แรงงานผิดกฎหมาย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0201" ID="rbt_4" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0201" ID="rbt_5" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0201" ID="rbt_6" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_2" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    มีหลักฐานแสดงความยินยอมทำงานล่วงเวลาและทำงานในวันหยุดงานของลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0202" ID="rbt_7" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0202" ID="rbt_8" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0202" ID="rbt_9" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_3" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีการชี้แจง/ปฐมนิเทศเกี่ยวกับเงื่อนไขการจ้าง
                                    เงื่อนไขการทำงานให้ลูกจ้าง ที่เข้างานใหม่รับทราบ (ทั้งนี้ เงื่อนไขสภาพการจ้าง
                                    สภาพการทำงานต้องเป็นไปตามกฎหมายแรงงาน)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0203" ID="rbt_10" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0203" ID="rbt_11" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0203" ID="rbt_12" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_4" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">4. ลูกจ้างสามารถลาออกจากงานได้ตามความต้องการ </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0204" ID="rbt_13" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0204" ID="rbt_14" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0204" ID="rbt_15" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_5" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5.
                                    ลูกจ้างมีเสรีภาพในการเข้าออกสถานที่ทำงานได้ในกรณีที่มีกิจธุระและมีอิสระในการทำกิจส่วนตัว
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0205" ID="rbt_16" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0205" ID="rbt_17" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0205" ID="rbt_18" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6.ไม่มีการบีบบังคับลูกจ้าง
                                    เช่นหักเงินค่าจ้างเพื่อร่วมทำกิจกรรมที่จัดขึ้นในสถานประกอบกิจการ
                                    การยึดบัตรประจำตัวประชาชน การข่มขู่ ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0206" ID="rbt_19" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0206" ID="rbt_20" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0206" ID="rbt_21" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_7" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7.
                                    ไม่มีการเรียกเก็บเงินประกันจากลูกจ้างยกเว้นกฎหมายกำหนดไว้
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0207" ID="rbt_22" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0207" ID="rbt_23" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0207" ID="rbt_24" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_8" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8.
                                    มีการวิธีการเก็บรักษาเงินประกันของลูกจ้างไว้ในธนาคารพาณิชย์หรือสถาบันการเงิน
                                    และมีการคืนเงิน ประกันภายใน 7 วัน เมื่อลูกจ้างลาออกหรือสิ้นสุดสัญญา
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0208" ID="rbt_25" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0208" ID="rbt_26" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0208" ID="rbt_27" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_9" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>3.
                                        ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีการจ่ายเงินค่าจ้างไม่ต่ำกว่าอัตราค่าจ้างขั้นต่ำ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0301" ID="rbt_28" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0301" ID="rbt_29" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0301" ID="rbt_30" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_10" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main" style="height: 30px">2.มีการจ่ายค่าล่วงเวลาในวันทำงานปกติและมีการจ่ายค่าล่วงเวลาในวันหยุดในอัตราไม่น้อยกว่า 1.5 เท่า และไม่น้อยกว่า 3 เท่าของอัตราค่าจ้างปกติ ตามลำดับ </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0302" ID="rbt_31" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0302" ID="rbt_32" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0302" ID="rbt_33" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_11" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 1
                                    เท่าของอัตราค่าจ้างปกติ กรณีลูกจ้างมีสิทธิได้รับค่าจ้างในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0303" ID="rbt_34" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0303" ID="rbt_35" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0303" ID="rbt_36" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_12" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 2
                                    เท่าของอัตราค่าจ้างปกติ กรณีไม่มีสิทธิได้รับค่าจ้างในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0304" ID="rbt_37" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0304" ID="rbt_38" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0304" ID="rbt_39" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_13" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการจ่ายค่าจ้าง ณ
                                    สถานที่ทำงานหรือสถานที่อื่นที่ลูกจ้างยินยอม
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0305" ID="rbt_40" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0305" ID="rbt_41" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0305" ID="rbt_42" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_14" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">6. มีการจ่ายค่าจ้างตรงตามเวลาที่กำหนด </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0306" ID="rbt_43" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0306" ID="rbt_44" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0306" ID="rbt_45" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_15" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7. มีเอกสารเกี่ยวกับการจ่ายค่าจ้าง
                                    แสดงให้ลูกจ้างทุกคนทราบ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0307" ID="rbt_46" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0307" ID="rbt_47" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0307" ID="rbt_48" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_16" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8.
                                    มีการเก็บเอกสารเกี่ยวกับการจ่ายค่าจ้างไว้ไม่น้อยกว่า 2 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0308" ID="rbt_49" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0308" ID="rbt_50" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0308" ID="rbt_51" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_17" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    9. ไม่มีการหักค่าจ้างไม่ว่ากรณีใด ๆ
                                    ยกเว้นที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0309" ID="rbt_52" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0309" ID="rbt_53" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0309" ID="rbt_54" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_18" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>4.
                                        ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีการกำหนดเวลาทำงานปกติของลูกจ้างวันหนึ่งไม่เกิน 8
                                    ชั่วโมง หรือ 48 ชั่วโมง/สัปดาห์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0401" ID="rbt_55" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0401" ID="rbt_56" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0401" ID="rbt_57" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_19" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2. มีการทำงานล่วงเวลา ไม่เกิน 36 ชั่วโมง/คน/สัปดาห์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0402" ID="rbt_58" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0402" ID="rbt_59" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0402" ID="rbt_60" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_20" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. งานอันอาจเป็นอันตราย มีการทำงานวันละไม่เกิน 7
                                    ชั่วโมง และสัปดาห์ละไม่เกิน 42 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0403" ID="rbt_61" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0403" ID="rbt_62" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0403" ID="rbt_63" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_21" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4. ในกิจการปิโตรเลียมมีการทำงานวันละไม่เกิน 12
                                    ชั่วโมง และสัปดาห์ละไม่เกิน 48 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0404" ID="rbt_64" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0404" ID="rbt_65" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0404" ID="rbt_66" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_22" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการกำหนดเวลาพักวันละไม่น้อยกว่า 1 ชั่วโมง
                                    หลังจากทำงานไม่เกิน 5 ชั่วโมงติดต่อกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0405" ID="rbt_67" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0405" ID="rbt_68" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0405" ID="rbt_69" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_23" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. มีการกำหนดเวลาพัก ไม่น้อยกว่า 1 ชั่วโมง
                                    หลังจากลูกจ้างขับขี่ยานพาหนะได้ทำงานมาแล้วไม่เกิน 4 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0406" ID="rbt_70" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0406" ID="rbt_71" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0406" ID="rbt_72" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_24" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7. มีเวลาพักอย่างน้อย 20 นาที
                                    ก่อนทำงานล่วงเวลาไม่น้อยกว่า 2 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0407" ID="rbt_73" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0407" ID="rbt_74" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0407" ID="rbt_75" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_25" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>5.วันหยุด วันลา
                                        (ข้อกำหนด 4.6)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">1. มีวันหยุดประจำสัปดาห์ไม่น้อยกว่า 1 วัน</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0501" ID="rbt_76" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0501" ID="rbt_77" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0501" ID="rbt_78" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_26" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2. มีประกาศวันหยุดตามประเพณีปีหนึ่งไม่น้อยกว่า 13 วัน
                                    และจ่ายค่าจ้างให้กับลูกจ้างทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0502" ID="rbt_79" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0502" ID="rbt_80" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0502" ID="rbt_81" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_27" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. กำหนดให้ลูกจ้างที่ทำงานครบ 1 ปี
                                    มีสิทธิหยุดพักผ่อนประจำปี ได้ไม่น้อยกว่าปีละ 6 วันทำงาน โดยได้รับค่าจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0503" ID="rbt_82" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0503" ID="rbt_83" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0503" ID="rbt_84" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_28" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย / ประกาศ
                                    หรือระเบียบปฏิบัติที่แสดงว่าไม่มีการเลือกปฏิบัติและลูกจ้างได้รับรู้ทั่วกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0601" ID="rbt_85" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0601" ID="rbt_86" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0601" ID="rbt_87" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_29" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    ประกาศรับสมัครงานไม่มีเกณฑ์เกี่ยวกับการเลือกปฏิบัติ เช่น ความแตกต่างในเรื่อง สัญชาติ
                                    เชื้อชาติ ศาสนา เพศ อายุ การติดเชื้อเอชไอวี หรือการเป็นสมาชิกสหภาพแรงงาน ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0602" ID="rbt_88" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0602" ID="rbt_89" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0602" ID="rbt_90" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_30" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3.
                                    มีการกำหนดข้อมูลที่ให้กรอกในใบสมัครงานเฉพาะข้อมูลเกี่ยวกับการศึกษา ประสบการณ์
                                    และความสามารถ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0603" ID="rbt_91" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0603" ID="rbt_92" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0603" ID="rbt_93" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_31" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4.
                                    มีการจ้างงานและจ่ายค่าตอบแทนลูกจ้างชายและหญิงเท่าเทียมกัน เช่น การกำหนดค่าจ้าง
                                    การเลื่อนตำแหน่ง การเกษียณอายุ ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0604" ID="rbt_94" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0604" ID="rbt_95" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0604" ID="rbt_96" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_32" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการจัดสวัสดิการให้ลูกจ้างทุกคนเสมอภาคและเป็นธรรม
                                    โดยไม่นำเชื้อชาติ ศาสนา เพศ มาเป็นเกณฑ์การตัดสิน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0605" ID="rbt_97" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0605" ID="rbt_98" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0605" ID="rbt_99" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_33" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. กรณีการเลิกจ้าง
                                    ต้องมีกระบวนการพิจารณาอย่างเป็นธรรม สอดคล้องตามระเบียบข้อบังคับเกี่ยวกับการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0606" ID="rbt_100" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0606" ID="rbt_101" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0606" ID="rbt_102" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_34" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7.
                                    มีระเบียบ/มีการปฏิบัติที่แสดงว่าไม่เลือกปฏิบัติต่อหญิงมีครรภ์ เช่น
                                    มีการรับลูกจ้างหญิงมีครรภ์เข้าทำงาน หรือเลิกจ้างลูกจ้างหญิงเพราะเหตุมีครรภ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0607" ID="rbt_103" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0607" ID="rbt_104" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0607" ID="rbt_105" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_35" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8.
                                    มีการกำหนดเกณฑ์การเกษียณอายุลูกจ้างชายและหญิงเท่าเทียมกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0608" ID="rbt_106" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0608" ID="rbt_107" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0608" ID="rbt_108" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_36" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    9. มีช่องทางการร้องเรียนกรณีลูกจ้างถูกเลือกปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0609" ID="rbt_109" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0609" ID="rbt_110" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0609" ID="rbt_111" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_37" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    10. มีการจ้างงานคนพิการ
                                    หรือส่งเงินเข้ากองทุนแทนการจ้างงาน หรือจัดพื้นที่ให้คนพิการจำหน่ายสินค้า
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0610" ID="rbt_112" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0610" ID="rbt_113" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0610" ID="rbt_114" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_38" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>7.วินัยและการลงโทษ (ข้อกำหนด 4.8)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1.
                                    มีข้อบังคับเกี่ยวกับการทำงานในเรื่องวินัยและการลงโทษ และลูกจ้างได้รับรู้ทั่วกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0701" ID="rbt_115" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0701" ID="rbt_116" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0701" ID="rbt_117" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_39" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    มีข้อบังคับ/หรือการปฏิบัติที่แสดงว่าไม่มีการหักค่าจ้างหรือการลดค่าจ้างเพื่อการลงโทษทางวินัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0702" ID="rbt_118" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0702" ID="rbt_119" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0702" ID="rbt_120" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_40" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีมาตรการมิให้ลูกจ้างถูกล่วงเกิน คุกคาม
                                    หรือก่อความเดือดร้อนรำคาญทางเพศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0703" ID="rbt_121" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0703" ID="rbt_122" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0703" ID="rbt_123" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_41" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>8.การล่วงเกินทางเพศและการ ใช้ความรุนแรง (ข้อกำหนด 4.9)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีมาตรการป้องกัน และแก้ไขปัญหาลูกจ้างถูกคุกคาม
                                    ล่วงเกิน หรือได้รับความเดือดร้อน รำคาญทางเพศ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0801" ID="rbt_124" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0801" ID="rbt_125" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0801" ID="rbt_126" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_42" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2. มีมาตรการป้องกัน
                                    และยุติการใช้ความรุนแรงในสถานประกอบกิจการ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0802" ID="rbt_127" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0802" ID="rbt_128" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0802" ID="rbt_129" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_43" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ ไม่ว่าจ้าง
                                    หรือไม่สนับสนุนให้มีการจ้างแรงงานเด็กที่ผิดกฎหมาย ทุกรูปแบบ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0901" ID="rbt_130" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0901" ID="rbt_131" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0901" ID="rbt_132" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_44" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    มีทะเบียนหรือแฟ้มประวัติลูกจ้างแสดงถึงอายุลูกจ้างทุกคนไม่ต่ำกว่า 15 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0902" ID="rbt_133" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0902" ID="rbt_134" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0902" ID="rbt_135" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_45" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีมาตรการควบคุมลูกจ้างอายุต่ำกว่า 18 ปี
                                    ไม่ให้ทำงานอันตรายหรืออยู่ในภาวะแวดล้อมที่อาจก่อให้เกิดอันตรายหรือทำงาน ระหว่างเวลา
                                    22.00 – 06.00 น. หรือทำงานล่วงเวลา หรือทำงานในงานบรรทุกหรือขนถ่ายสินค้าเรือเดินทะเล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0903" ID="rbt_136" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0903" ID="rbt_137" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0903" ID="rbt_138" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_46" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4. มีบันทึกสภาพการจ้างลูกจ้างเด็ก
                                    และมีการแจ้งการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0904" ID="rbt_139" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0904" ID="rbt_140" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0904" ID="rbt_141" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_47" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการแจ้งสิ้นสุดการจ้างลูกจ้างเด็กอายุต่ำกว่า 18
                                    ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0905" ID="rbt_142" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0905" ID="rbt_143" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0905" ID="rbt_144" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_48" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. ลูกจ้างเด็กมีเวลาพักระหว่างการทำงาน 4 ชั่วโมงแรก
                                    และได้พักไม่น้อยกว่า 1 ชั่วโมงหลังทำงานมาแล้วไม่เกิน 4 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0906" ID="rbt_145" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0906" ID="rbt_146" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0906" ID="rbt_147" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_49" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7. มีระเบียบ ข้อบังคับ
                                    หรือการปฏิบัติที่แสดงว่าไม่มีการเรียกหลักประกันจากลูกจ้างเด็กและไม่จ่ายค่าจ้างของลูกจ้างเด็กให้แก่บุคคลอื่น
                                    และไม่มีการนำผลประโยชน์ใดที่จ่ายให้ล่วงหน้าก่อนการจ้างมาหักจากค่าจ้างของลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0907" ID="rbt_148" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0907" ID="rbt_149" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0907" ID="rbt_150" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_50" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8. ลูกจ้างเด็กมีสิทธิเพื่อการพัฒนา เช่น ประชุม สัมมนา
                                    ฝึกอบรม และมีการจ่ายค่าจ้างเพื่อการพัฒนาปีละไม่เกิน 30 วัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0908" ID="rbt_151" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0908" ID="rbt_152" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a0908" ID="rbt_153" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_51" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีนโยบายสนับสนุน
                                    และส่งเสริมการเลี้ยงลูกด้วยนมแม่ในสถานประกอบกิจการ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1001" ID="rbt_154" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1001" ID="rbt_155" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1001" ID="rbt_156" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_52" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    มีประกาศอนุญาตให้ลูกจ้างหญิงพักเพื่อเก็บน้ำนมในช่วงให้นมบุตร โดยให้นับเป็นเวลาทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1002" ID="rbt_157" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1002" ID="rbt_158" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1002" ID="rbt_159" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_53" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3.
                                    มีมาตรการควบคุมหรือระเบียบปฏิบัติไม่ให้ลูกจ้างหญิงตั้งครรภ์
                                    ทำงานอย่างใดอย่างหนึ่งตามที่กฎหมายกำหนด และไม่มีการทำงานระหว่างเวลา 22.00-06.00 น.
                                    และไม่ให้ทำงานล่วงเวลายกเว้นงานที่กฎหมายกำหนด ซึ่งไม่มีผลกระทบต่อสุขภาพของลูกจ้าง
                                    และไม่มีการทำงานในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1003" ID="rbt_160" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1003" ID="rbt_161" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1003" ID="rbt_162" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_54" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">4. ลูกจ้างหญิงตั้งครรภ์มีสิทธิเปลี่ยนงาน</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1004" ID="rbt_163" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1004" ID="rbt_164" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1004" ID="rbt_165" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_55" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ การไม่เลิกจ้าง
                                    ลดตำแหน่ง หรือสิทธิประโยชน์เพราะเหตุ จากการมีครรภ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1005" ID="rbt_166" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1005" ID="rbt_167" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1005" ID="rbt_168" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_56" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. ลูกจ้างหญิงมีสิทธิลาคลอดได้ 98 วัน
                                    โดยได้รับค่าจ้างไม่น้อยกว่า 45 วัน มีการจัดมุมนมแม่ โดยมีการจัดสถานที่และอุปกรณ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1006" ID="rbt_169" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1006" ID="rbt_170" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1006" ID="rbt_171" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_57" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการแทรกแซงขัดขวางการรวมตัวเพื่อจัดตั้งองค์กรของลูกจ้างหรือการเจรจาต่อรอง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1101" ID="rbt_172" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1101" ID="rbt_173" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1101" ID="rbt_174" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_58" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างหรือกระทำการอันเป็นผลให้ลูกจ้างไม่สามารถทนทำงานต่อไปได้เพราะเหตุที่ลูกจ้างยื่นข้อเรียกร้องเจรจาหรือเข้าเป็นสมาชิกสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1102" ID="rbt_175" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1102" ID="rbt_176" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1102" ID="rbt_177" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_59" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการขัดขวางแทรกแซงการดำเนินงานของสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1103" ID="rbt_178" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1103" ID="rbt_179" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1103" ID="rbt_180" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_60" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4.
                                    มีการเจรจาต่อรองหรือพูดคุยกันกับผู้แทนลูกจ้างหรือองค์กรลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1104" ID="rbt_181" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1104" ID="rbt_182" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1104" ID="rbt_183" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_61" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างลงโทษ
                                    หรือขัดขวางการปฏิบัติหน้าที่ของกรรมการลูกจ้างเว้นแต่ได้รับอนุญาตจากศาลแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1105" ID="rbt_184" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1105" ID="rbt_185" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1105" ID="rbt_186" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_62" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. มีการปฏิบัติที่เป็นธรรม
                                    ต่อผู้แทนลูกจ้างหรือลูกจ้างที่เป็นสมาชิกของสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1106" ID="rbt_187" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1106" ID="rbt_188" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1106" ID="rbt_189" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_63" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>12.ความปลอดภัย
                                        อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีนโยบายด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1201" ID="rbt_190" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1201" ID="rbt_191" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1201" ID="rbt_192" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_64" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main" style="height: 30px">
                                    2.
                                    มีโครงสร้างการบริหารด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1202" ID="rbt_193" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1202" ID="rbt_194" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1202" ID="rbt_195" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:TextBox ID="txt_input_65" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีแผนงานด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้มในการทำงาน และการนำไปปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1203" ID="rbt_196" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1203" ID="rbt_197" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1203" ID="rbt_198" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_66" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4. มีการประเมินผลและทบทวนการจัดการด้านความปลอดภัย
                                    อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1204" ID="rbt_199" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1204" ID="rbt_200" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1204" ID="rbt_201" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_67" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีการดำเนินการปรับปรุงด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1205" ID="rbt_202" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1205" ID="rbt_203" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1205" ID="rbt_204" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_68" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6. มีประกาศให้ลูกจ้างทราบ เรื่อง สิทธิ
                                    ขั้นตอนการปฏิเสธการทำงานที่ไม่มีมาตรการด้านความปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1206" ID="rbt_205" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1206" ID="rbt_206" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1206" ID="rbt_207" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_69" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7.
                                    มีการติดข้อความแสดงสิทธิและหน้าที่ของนายจ้างและลูกจ้างเกี่ยวกับความปลอดภัยในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1207" ID="rbt_208" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1207" ID="rbt_209" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1207" ID="rbt_210" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_70" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8. มีข้อบังคับ และคู่มือว่าด้วยความปลอดภัยในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1208" ID="rbt_211" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1208" ID="rbt_212" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1208" ID="rbt_213" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_71" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    9.
                                    มีการติดประกาศสัญลักษณ์เตือนอันตรายและเครื่องหมายเกี่ยวกับความปลอดภัย
                                    อาชีวอนามัยและสภาพแวดล้อมในการทำงาน รวมทั้งข้อความแสดงสิทธิของนายจ้างและลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1209" ID="rbt_214" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1209" ID="rbt_215" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1209" ID="rbt_216" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_72" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    10.
                                    มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการความปลอดภัยอาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                    (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1210" ID="rbt_217" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1210" ID="rbt_218" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1210" ID="rbt_219" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_73" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    11. คณะกรรมการความปลอดภัยฯ
                                    ได้รับการอบรมเกี่ยวกับบทบาทหน้าที่ตามกฎหมายครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1211" ID="rbt_220" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1211" ID="rbt_221" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1211" ID="rbt_222" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_74" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    12. คณะกรรมการความปลอดภัยฯมีการประชุม
                                    อย่างน้อยเดือนละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1212" ID="rbt_223" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1212" ID="rbt_224" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1212" ID="rbt_225" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_75" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    13. หัวหน้างานได้รับการฝึกอบรมและแต่งตั้งเป็น
                                    จป.หัวหน้างานครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1213" ID="rbt_226" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1213" ID="rbt_227" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1213" ID="rbt_228" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_76" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    14. ผู้บริหารได้รับการฝึกอบรมและแต่งตั้ง เป็น
                                    จป.บริหารครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1214" ID="rbt_229" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1214" ID="rbt_230" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1214" ID="rbt_231" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_77" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    15. มี จป.ระดับเทคนิค/เทคนิคชั้นสูง/วิชาชีพ
                                    ตามที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1215" ID="rbt_232" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1215" ID="rbt_233" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1215" ID="rbt_234" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_78" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    16.
                                    มีการจัดตั้งหน่วยงานความปลอดภัยอาชีวอนามัยและสภาพแวดล้อมในการทำงานของสถานประกอบกิจการ
                                    (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1216" ID="rbt_235" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1216" ID="rbt_236" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1216" ID="rbt_237" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_79" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    17. หน่วยงานความปลอดภัยขึ้นตรงต่อผู้บริหารสูงสุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1217" ID="rbt_238" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1217" ID="rbt_239" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1217" ID="rbt_240" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_80" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    18. ลูกจ้างทุกคนได้รับการฝึกอบรมความปลอดภัย
                                    อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1218" ID="rbt_241" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1218" ID="rbt_242" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1218" ID="rbt_243" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_81" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    19.
                                    มีการติดตั้งเครื่องป้องกันอันตรายจากเครื่องจักรอย่างครบถ้วน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1219" ID="rbt_244" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1219" ID="rbt_245" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1219" ID="rbt_246" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_82" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    20.
                                    มีการตรวจสอบสายไฟฟ้าและอุปกรณ์ไฟฟ้าประจำปีโดยวิศวกร
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1220" ID="rbt_247" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1220" ID="rbt_248" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1220" ID="rbt_249" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_83" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    21.
                                    มีการซ่อมแซมตรวจสอบหรือติดตั้งอุปกรณ์ไฟฟ้าพร้อมสายดินอย่างครบถ้วน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1221" ID="rbt_250" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1221" ID="rbt_251" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1221" ID="rbt_252" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_84" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    22.
                                    มีการทดสอบส่วนประกอบและอุปกรณ์ปั้นจั่นทุกเครื่องตามที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1222" ID="rbt_253" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1222" ID="rbt_254" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1222" ID="rbt_255" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_85" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    23. มีการทดสอบหม้อน้ำประจำปีโดยวิศวกร
                                    และผู้ควบคุมหม้อน้ำผ่านการอบรมครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1223" ID="rbt_256" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1223" ID="rbt_257" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1223" ID="rbt_258" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_86" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">24. มีตรวจสอบสภาพลิฟต์ขนส่งประจำปีโดยวิศวกร</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1224" ID="rbt_259" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1224" ID="rbt_260" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1224" ID="rbt_261" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_87" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">25. มีแผนป้องกัน และระงับอัคคีภัย</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1225" ID="rbt_262" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1225" ID="rbt_263" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1225" ID="rbt_264" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_88" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    26.
                                    มีลูกจ้างผ่านการอบรมหลักสูตรการดับเพลิงขั้นต้นไม่น้อยกว่าร้อยละ 40
                                    ของจำนวนลูกจ้างในแต่ละหน่วยงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1226" ID="rbt_265" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1226" ID="rbt_266" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1226" ID="rbt_267" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_89" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    27.
                                    ลูกจ้างทุกคนได้รับการฝึกซ้อมดับเพลิงและอพยพหนีไฟเป็นประจำทุกปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1227" ID="rbt_268" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1227" ID="rbt_269" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1227" ID="rbt_270" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_90" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    28. มีแผนการตรวจสอบอุปกรณ์ดับเพลิง
                                    และมีการตรวจสอบตามแผนที่กำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1228" ID="rbt_271" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1228" ID="rbt_272" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1228" ID="rbt_273" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_91" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    29.
                                    มีระบบน้ำดับเพลิงและอุปกรณ์และอุปกรณ์ประกอบเพื่อใช้ในการดับเพลิง ได้แก่ ปั๊มน้ำ
                                    ข้อต่อสายส่งน้ำดับเพลิง และสายส่งน้ำดับเพลิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1229" ID="rbt_274" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1229" ID="rbt_275" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1229" ID="rbt_276" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_92" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    30.
                                    มีการตรวจวัดและวิเคราะห์สภาวะการทำงานเกี่ยวกับระดับความร้อนแสงสว่าง และเสียง
                                    เป็นประจำทุกปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1230" ID="rbt_277" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1230" ID="rbt_278" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1230" ID="rbt_279" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_93" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    31. มีการตรวจสอบอุปกรณ์แสดงอุณหภูมิในห้องเย็น
                                    และมีการกำหนดระยะเวลาการทำงานของลูกจ้างในห้องเย็นอย่างปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1231" ID="rbt_280" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1231" ID="rbt_281" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1231" ID="rbt_282" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_94" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    32. มีสัญญาณแจ้งเหตุฉุกเฉิน ประตูมีระบบเปิดจากด้านใน
                                    และมีการจัดชุดปฏิบัติที่เหมาะ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1232" ID="rbt_283" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1232" ID="rbt_284" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1232" ID="rbt_285" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_95" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    33.
                                    มีการจัดและดูแลให้ลูกจ้างสวมใส่อุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคลตามสภาพและลักษณะของงานตลอดระยะเวลาทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1233" ID="rbt_286" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1233" ID="rbt_287" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1233" ID="rbt_288" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_96" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    34. มีการตรวจวัดภาวะแวดล้อมสารเคมีในอากาศ
                                    (ปริมาณฝุ่น/สารเคมีที่ฟุ้งกระจาย)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1234" ID="rbt_289" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1234" ID="rbt_290" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1234" ID="rbt_291" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_97" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    35. มีการแจ้งบัญชีรายชื่อสารเคมีอันตราย
                                    และรายละเอียดข้อความปลอดภัยของสารเคมีอันตรายที่มีอยู่ในครอบครอง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1235" ID="rbt_292" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1235" ID="rbt_293" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1235" ID="rbt_294" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_98" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    36.
                                    มีการแจ้งลูกจ้างที่ทำงานเกี่ยวกับการสารเคมีอันตรายทราบและเข้าใจวิธีการทำงานที่ถูกต้องและปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1236" ID="rbt_295" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1236" ID="rbt_296" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1236" ID="rbt_297" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_99" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    37. มีการจัดทำคู่มือเกี่ยวกับการปฏิบัติ
                                    และขั้นตอนการทำงานเกี่ยวกับสารเคมีอันตราย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1237" ID="rbt_298" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1237" ID="rbt_299" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1237" ID="rbt_300" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_100" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    38. มีการปิดประกาศหรือจัดทำป้ายแจ้งข้อความ
                                    “ห้ามสูบบุหรี่ หรือรับประทานอาหาร หรือเครื่องดื่ม ประกอบอาหาร หรือเก็บอาหาร”
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1238" ID="rbt_301" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1238" ID="rbt_302" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1238" ID="rbt_303" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_101" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    39. มีป้ายแจ้งข้อความ “ที่อับอากาศ อันตราย ห้ามเข้า”
                                    ติดตั้งไว้โดยเปิดเผยบริเวณที่เข้าออกทางอับอากาศทุกแห่ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1239" ID="rbt_304" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1239" ID="rbt_305" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1239" ID="rbt_306" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_102" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    40. มีการฝึกอบรมความปลอดภัยฯ ในที่อับอากาศ
                                    ให้กับผู้มีหน้าที่รับผิดชอบในการอนุญาต ผู้ควบคุมงาน ผู้ช่วยเหลือ และผู้ปฏิบัติงาน
                                    ในที่อับอากาศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1240" ID="rbt_310" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1240" ID="rbt_311" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1240" ID="rbt_312" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_104" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">41. มีหนังสืออนุญาตให้ลูกจ้างทำงานในที่อับอากาศ</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1241" ID="rbt_313" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1241" ID="rbt_314" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1241" ID="rbt_315" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_105" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    42. มีการกำหนดพื้นที่ควบคุมโดยจัดทำรั้ว
                                    คอกกั้นหรือเส้นแสดงแนวเขตและจัดให้มีป้ายข้อความ“ระวังอันตรายจากรังสี ห้ามเข้า”
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1242" ID="rbt_316" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1242" ID="rbt_317" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1242" ID="rbt_318" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_106" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    43.
                                    มีผู้รับผิดชอบดำเนินการทางด้านเทคนิคในเรื่องรังสีตลอดระยะเวลาที่มีการทำงานเกี่ยวกับรังสีอย่างน้อย
                                    1 คน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1243" ID="rbt_319" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1243" ID="rbt_320" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1243" ID="rbt_321" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_107" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    44. มีแผนป้องกันและระงับอันตรายจากรังสี
                                    และมีการฝึกซ้อมตามแผน อย่างน้อยปีละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1244" ID="rbt_322" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1244" ID="rbt_323" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1244" ID="rbt_324" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_108" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main" style="height: 30px">
                                    45.
                                    มีการตรวจสุขภาพลูกจ้างใหม่ที่ทำงานเกี่ยวกับปัจจัยเสี่ยง ภายใน 30 วัน
                                    และตรวจครั้งต่อไปอย่างน้อยปีละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1245" ID="rbt_325" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1245" ID="rbt_326" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:RadioButton GroupName="a1245" ID="rbt_327" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:TextBox ID="txt_input_109" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    46.
                                    จัดให้มีสมุดสุขภาพประจำตัวของลูกจ้างที่ทำงานเกี่ยวกับปัจจัยเสี่ยง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1246" ID="rbt_328" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1246" ID="rbt_329" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1246" ID="rbt_330" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_110" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    47. ได้ส่งรายงาน
                                    จผส.๑ในกรณีผลการตรวจสุขภาพของลูกจ้างพบความผิดปกติหรือพบว่ามีลูกจ้างเจ็บป่วยเนื่องจากการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1247" ID="rbt_331" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1247" ID="rbt_332" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1247" ID="rbt_333" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_111" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)</strong>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1. มีห้องอาบน้ำถูกต้องตามสุขลักษณะ
                                    และมีจำนวนเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1301" ID="rbt_307" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1301" ID="rbt_308" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1301" ID="rbt_309" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_103" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">2. มีการแยกห้องอาบน้ำระหว่างลูกจ้างชายและหญิง</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1302" ID="rbt_334" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1302" ID="rbt_335" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1302" ID="rbt_336" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_112" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    3. มีห้องส้วมถูกต้องตามสุขลักษณะ
                                    และมีจำนวนเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1303" ID="rbt_337" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1303" ID="rbt_338" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1303" ID="rbt_339" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_113" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    4. มีการแยกห้องส้วมระหว่างลูกจ้างชายและลูกจ้างหญิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1304" ID="rbt_340" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1304" ID="rbt_341" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1304" ID="rbt_342" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_114" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    5. มีกระดาษชำระหรือน้ำสำหรับชำระล้าง
                                    และมีกำหนดผู้รับผิดชอบการทำความสะอาด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1305" ID="rbt_343" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1305" ID="rbt_344" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1305" ID="rbt_345" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_115" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    6.
                                    มีผลการตรวจคุณภาพน้ำดื่มและมีปริมาณเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1306" ID="rbt_346" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1306" ID="rbt_347" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1306" ID="rbt_348" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_116" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    7. มีปัจจัยการปฐมพยาบาลตามที่กฎหมายกำหนด
                                    และมีทะเบียนควบคุมรายการปัจจัยการปฐมพยาบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1307" ID="rbt_349" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1307" ID="rbt_350" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1307" ID="rbt_351" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_117" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    8. มีสถานที่รับประทานอาหารสะอาดและถูกหลักสุขาภิบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1308" ID="rbt_352" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1308" ID="rbt_353" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1308" ID="rbt_354" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_118" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    9. มีสถานที่เก็บอาหารที่สะอาดและถูกหลักสุขาภิบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1309" ID="rbt_355" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1309" ID="rbt_356" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1309" ID="rbt_357" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_119" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    10. มีมาตรการควบคุมสุขอนามัยของผู้ปรุงอาหาร เช่น
                                    การจัดให้มีการตรวจสุขภาพประจำปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1310" ID="rbt_358" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1310" ID="rbt_359" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1310" ID="rbt_360" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_120" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    11. มีห้องรักษาพยาบาลพร้อมเตียงพักคนไข้
                                    เวชภัณฑ์และยาเพียงพอแก่การรักษาพยาบาลเบื้องต้น (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1311" ID="rbt_361" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1311" ID="rbt_362" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1311" ID="rbt_363" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_121" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    12.
                                    มีพยาบาลตั้งแต่ระดับพยาบาลเทคนิคขึ้นไปประจำตลอดเวลาทำงาน (กรณีมีลูกจ้างตั้งแต่ 200
                                    คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1312" ID="rbt_364" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1312" ID="rbt_365" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1312" ID="rbt_366" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_122" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    13. มีแพทย์แผนปัจจุบันชั้นหนึ่ง
                                    หรือมีสัญญากับโรงพยาบาลแทนการจัดให้มีแพทย์ (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1313" ID="rbt_367" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1313" ID="rbt_368" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1313" ID="rbt_369" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_123" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row-main">
                                <div class="detail-quations-main">14. กรณีมีการจัดที่พักอาศัยให้กับลูกจ้าง </div>
                                <div class="section-from">
                                    <div class="detail-quations" colspan="5"></div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    1)
                                    มีความเป็นสัดส่วนแยกระหว่างลูกจ้างชายและลูกจ้างหญิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13141" ID="rbt_370" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13141" ID="rbt_371" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13141" ID="rbt_372" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_124" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">
                                    2) มีอุปกรณ์
                                    เครื่องใช้เพื่อให้ลูกจ้างพักผ่อนนอนหลับได้สุขสบายตามสภาพ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13142" ID="rbt_373" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13142" ID="rbt_374" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13142" ID="rbt_375" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_126" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">3) มีการทำความสะอาดที่พักอยู่เป็นประจำ</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13143" ID="rbt_376" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13143" ID="rbt_377" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13143" ID="rbt_378" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_127" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main">4) มีการรักษาความปลอดภัยให้กับลูกจ้าง</div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13144" ID="rbt_379" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13144" ID="rbt_380" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a13144" ID="rbt_381" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_128" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row-main">
                                <div class="detail-quations-main">
                                    15.
                                    มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการสวัสดิการในสถานประกอบกิจการ จำนวนไม่น้อยกว่า 5 คน
                                    (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1315" ID="rbt_382" runat="server"></asp:RadioButton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1315" ID="rbt_383" runat="server"></asp:RadioButton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:RadioButton GroupName="a1315" ID="rbt_384" runat="server"></asp:RadioButton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:TextBox ID="txt_input_125" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div class="detail-quations-main" colspan="5"></div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div class="container my-4">
                <div class="d-flex justify-content-center align-items-center flex-column w-100 p-5 gap-2">
                    <!-- ลงชื่อผู้ตอบรับเอกสาร -->
                    <div class="d-flex flex-column flex-wrap mb-3 align-items-start">
                        <label class="text-center fw-bold me-3" style="min-width: 170px;">ลงชื่อผู้ตอบรับเอกสาร</label>
                        <div class="flex-grow-1">
                            <asp:TextBox CssClass="form-control mb-1" ID="txtRemark_2" Rows="3" runat="server"
                                TextMode="SingleLine"></asp:TextBox>
                            <div class="text-danger">** ระบุ เป็น ชื่อ - นามสกุล</div>
                        </div>
                    </div>
                    <!-- หมายเหตุ -->
                    <div class="d-flex flex-column flex-wrap mb-3 align-items-start">
                        <label class="text-center fw-bold me-3" style="min-width: 170px;">หมายเหตุ</label>
                        <div class="flex-grow-1">
                            <asp:TextBox CssClass="form-control" ID="txtRemark_3" Rows="3" runat="server"
                                TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!-- ปุ่ม -->
                <div class="d-flex justify-content-center gap-2 mt-4">
                    <asp:Button CssClass="btn-cancle" ID="btCancel" runat="server" Text="CANCEL" Visible="true"></asp:Button>
                    <asp:Button CssClass="btn-submit" ID="btSave" runat="server" Text="SAVE" Visible="true"></asp:Button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // ฟังก์ชันในการเก็บข้อมูลลงในคุกกี้
        function saveDataToCookie() {
            // วนลูปผ่านทุก RadioButton
            document.querySelectorAll('input[type="radio"]').forEach((radio) => {
                let index = radio.getAttribute('data-index');
                if (radio.checked) {
                    document.cookie = `radioData_${index}=${radio.value}; path=/;`;
                }
            });

            // วนลูปผ่านทุก TextBox
            document.querySelectorAll('input[type="text"]').forEach((textbox) => {
                let index = textbox.getAttribute('data-index');
                document.cookie = `inputData_${index}=${textbox.value}; path=/;`;
            });
        }

        // ฟังก์ชันในการดึงข้อมูลจากคุกกี้
        function loadDataFromCookie() {
            document.querySelectorAll('input[type="radio"]').forEach((radio) => {
                let index = radio.getAttribute('data-index');
                let radioData = getCookie(`radioData_${index}`);
                if (radioData) {
                    document.querySelector(`input[name="a0207"][value="${radioData}"]`).checked = true;
                }
            });

            document.querySelectorAll('input[type="text"]').forEach((textbox) => {
                let index = textbox.getAttribute('data-index');
                let inputData = getCookie(`inputData_${index}`);
                if (inputData) {
                    textbox.value = inputData;
                }
            });
        }

        // ฟังก์ชันในการดึงคุกกี้
        function getCookie(name) {
            let nameEq = name + "=";
            let ca = document.cookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i].trim();
                if (c.indexOf(nameEq) == 0) return c.substring(nameEq.length, c.length);
            }
            return "";
        }

        // เมื่อหน้าโหลด, ดึงข้อมูลจากคุกกี้
        window.onload = function () {
            loadDataFromCookie();
        }

        // บันทึกข้อมูลเมื่อมีการเปลี่ยนแปลง
        document.querySelectorAll('input[type="radio"]').forEach((radio) => {
            radio.addEventListener('change', saveDataToCookie);
        });

        document.querySelectorAll('input[type="text"]').forEach((textbox) => {
            textbox.addEventListener('input', saveDataToCookie);
        });
    </script>
</asp:Content>
