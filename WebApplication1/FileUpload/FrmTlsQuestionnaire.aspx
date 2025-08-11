<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FrmTlsQuestionnaire.aspx.vb" Inherits="Form_FFrmTlsQuestionnaire" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> TLS8001/Sa08000 - แบบสอบถามการประเมินตัวเอง (ผู้ส่งมอบ/ผู้รับเหมาช่วง)</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="../css/tls/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="../css/tls/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="../js/tls/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJa07l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body style="font-family :Sans-Serif ;">


<div class="container">
  <div class="row">

    <div class="col-md-1"></div>
    <div class="col-md-7">
      <h3 align="center"><asp:Label ID="lblCompany" runat="server" Text="ชื่อสถานประกอบการ : - " Font-Bold="true" ForeColor="Blue"></asp:Label></h3>
      <h3 align="center"> TLS8001/Sa08000 - แบบสอบถามการประเมินตัวเอง (ผู้ส่งมอบ/ผู้รับเหมาช่วง)</h3>
      <form id="formq"  runat ="server" >
      <asp:HiddenField ID="hdfTlsId" runat="server" />
      <asp:HiddenField ID="hdfSupplierId" runat="server" /> 
        <table width="1024px" border="1" align="center" cellpadding="0" cellspacing="0" id="tblCustomers">
          <tr>
            <td width="75%" rowspan="2" align="center"><strong>รายการ</strong></td>
            <td colspan="4" align="center"><strong>ผลการประเมิน</strong></td>
          </tr>
          <tr>
            <td width="5%" align="center"><strong>ใช่</strong></td>
            <td width="7%" align="center"><strong>ไม่ใช่</strong></td>
            <td width="10%" align="center"><strong>ไม่เกี่่ยวข้อง</strong></td>
            <td width="20%" align="center"><strong>หมายเหตุ</strong></td>            
          </tr>
          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>1.ข้อกำหนดทั่วไป (ข้อกำหนด 4.1)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีเอกสารตามที่กฎหมายแรงงานกำหนด ได้แก่ข้อบังคับเกี่ยวกับการทำงาน ทะเบียนลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_1" GroupName="a0101"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_2"  GroupName="a0101"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_3"  GroupName="a0101"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_1" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>2. การบังคับใช้แรงงาน   (ข้อกำหนด 4.3)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีนโยบาย/ประกาศ/ระเบียบ ห้ามมีการบังคับใช้แรงงานในทุกรูปแบบและไม่เข้าไปมีส่วนร่วมในการใช้แรงงานผิดกฎหมาย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_4" GroupName="a0201"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_5"  GroupName="a0201"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_6"  GroupName="a0201"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_2" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;2. มีหลักฐานแสดงความยินยอมทำงานล่วงเวลาและทำงานในวันหยุดงานของลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_7" GroupName="a0202"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_8"  GroupName="a0202"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_9"  GroupName="a0202"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_3" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. มีการชี้แจง/ปฐมนิเทศเกี่ยวกับเงื่อนไขการจ้าง เงื่อนไขการทำงานให้ลูกจ้าง ที่เข้างานใหม่รับทราบ (ทั้งนี้ เงื่อนไขสภาพการจ้าง สภาพการทำงานต้องเป็นไปตามกฎหมายแรงงาน)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_10" GroupName="a0203"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_11"  GroupName="a0203"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_12"  GroupName="a0203"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_4" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;4. ลูกจ้างสามารถลาออกจากงานได้ตามความต้องการ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_13" GroupName="a0204"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_14"  GroupName="a0204"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_15"  GroupName="a0204"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_5" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;5. ลูกจ้างมีเสรีภาพในการเข้าออกสถานที่ทำงานได้ในกรณีที่มีกิจธุระและมีอิสระในการทำกิจส่วนตัว </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_16" GroupName="a0205"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_17"  GroupName="a0205"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_18"  GroupName="a0205"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_6" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;6.ไม่มีการบีบบังคับลูกจ้าง  เช่นหักเงินค่าจ้างเพื่อร่วมทำกิจกรรมที่จัดขึ้นในสถานประกอบกิจการ	การยึดบัตรประจำตัวประชาชน การข่มขู่ ฯลฯ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_19" GroupName="a0206"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_20"  GroupName="a0206"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_21"  GroupName="a0206"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_7" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;7. ไม่มีการเรียกเก็บเงินประกันจากลูกจ้างยกเว้นกฎหมายกำหนดไว้ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_22" GroupName="a0207"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_23"  GroupName="a0207"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_24"  GroupName="a0207"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_8" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;8. มีการวิธีการเก็บรักษาเงินประกันของลูกจ้างไว้ในธนาคารพาณิชย์หรือสถาบันการเงิน และมีการคืนเงิน ประกันภายใน 7 วัน เมื่อลูกจ้างลาออกหรือสิ้นสุดสัญญา</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_25" GroupName="a0208"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_26"  GroupName="a0208"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_27"  GroupName="a0208"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_9" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>3. ค่าตอบแทนการทำงาน   (ข้อกำหนด 4.4)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีการจ่ายเงินค่าจ้างไม่ต่ำกว่าอัตราค่าจ้างขั้นต่ำ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_28" GroupName="a0301"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_29"  GroupName="a0301"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_30"  GroupName="a0301"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_10" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td style="height: 30px">&nbsp;2. มีการจ่ายค่าล่วงเวลาในวันทำงานปกติและมีการจ่ายค่าล่วงเวลาในวันหยุด ในอัตราไม่น้อยกว่า 1.5 เท่า และไม่น้อยกว่า 3 เท่าของอัตราค่าจ้างปกติ ตามลำดับ </td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_31" GroupName="a0302"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_32"  GroupName="a0302"   runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_33"  GroupName="a0302"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:TextBox ID="txt_input_11" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;3. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 1 เท่าของอัตราค่าจ้างปกติ กรณีลูกจ้างมีสิทธิได้รับค่าจ้างในวันหยุด </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_34" GroupName="a0303"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_35"  GroupName="a0303"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_36"  GroupName="a0303"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_12" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;4. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 2 เท่าของอัตราค่าจ้างปกติ กรณีไม่มีสิทธิได้รับค่าจ้างในวันหยุด </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_37" GroupName="a0304"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_38"  GroupName="a0304"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_39"  GroupName="a0304"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_13" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;5. มีการจ่ายค่าจ้าง ณ สถานที่ทำงานหรือสถานที่อื่นที่ลูกจ้างยินยอม </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_40" GroupName="a0305"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_41"  GroupName="a0305"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_42"  GroupName="a0305"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_14" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;6. มีการจ่ายค่าจ้างตรงตามเวลาที่กำหนด </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_43" GroupName="a0306"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_44"  GroupName="a0306"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_45"  GroupName="a0306"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_15" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;7. มีเอกสารเกี่ยวกับการจ่ายค่าจ้าง แสดงให้ลูกจ้างทุกคนทราบ  </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_46" GroupName="a0307"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_47"  GroupName="a0307"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_48"  GroupName="a0307"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_16" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;8. มีการเก็บเอกสารเกี่ยวกับการจ่ายค่าจ้างไว้ไม่น้อยกว่า 2 ปี </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_49" GroupName="a0308"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_50"  GroupName="a0308"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_51"  GroupName="a0308"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_17" runat="server"></asp:TextBox></td>
          </tr>
                     <tr>
            <td height="30">&nbsp;9. ไม่มีการหักค่าจ้างไม่ว่ากรณีใด ๆ ยกเว้นที่กฎหมายกำหนด </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_52" GroupName="a0309"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_53"  GroupName="a0309"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_54"  GroupName="a0309"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_18" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>4. ชั่วโมงการทำงาน และเวลาพัก  (ข้อกำหนด 4.5)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีการกำหนดเวลาทำงานปกติของลูกจ้างวันหนึ่งไม่เกิน 8 ชั่วโมง หรือ 48 ชั่วโมง/สัปดาห์ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_55" GroupName="a0401"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_56"  GroupName="a0401"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_57"  GroupName="a0401"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_19" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;2. มีการทำงานล่วงเวลา ไม่เกิน 36 ชั่วโมง/คน/สัปดาห์ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_58" GroupName="a0402"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_59"  GroupName="a0402"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_60"  GroupName="a0402"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_20" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;3. งานอันอาจเป็นอันตราย มีการทำงานวันละไม่เกิน 7 ชั่วโมง และสัปดาห์ละไม่เกิน 42 ชั่วโมง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_61" GroupName="a0403"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_62"  GroupName="a0403"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_63"  GroupName="a0403"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_21" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;4. ในกิจการปิโตรเลียมมีการทำงานวันละไม่เกิน 12 ชั่วโมง และสัปดาห์ละไม่เกิน 48 ชั่วโมง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_64" GroupName="a0404"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_65"  GroupName="a0404"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_66"  GroupName="a0404"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_22" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;5. มีการกำหนดเวลาพักวันละไม่น้อยกว่า  1 ชั่วโมง หลังจากทำงานไม่เกิน 5 ชั่วโมงติดต่อกัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_67" GroupName="a0405"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_68"  GroupName="a0405"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_69"  GroupName="a0405"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_23" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;6. มีการกำหนดเวลาพัก ไม่น้อยกว่า 1 ชั่วโมง หลังจากลูกจ้างขับขี่ยานพาหนะได้ทำงานมาแล้วไม่เกิน 4 ชั่วโมง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_70" GroupName="a0406"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_71"  GroupName="a0406"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_72"  GroupName="a0406"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_24" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;7. มีเวลาพักอย่างน้อย 20 นาที ก่อนทำงานล่วงเวลาไม่น้อยกว่า 2 ชั่วโมง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_73" GroupName="a0407"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_74"  GroupName="a0407"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_75"  GroupName="a0407"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_25" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>5.วันหยุด วันลา (ข้อกำหนด 4.6)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีวันหยุดประจำสัปดาห์ไม่น้อยกว่า 1 วัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_76" GroupName="a0501"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_77"  GroupName="a0501"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_78"  GroupName="a0501"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_26" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;2. มีประกาศวันหยุดตามประเพณีปีหนึ่งไม่น้อยกว่า 13 วัน และจ่ายค่าจ้างให้กับลูกจ้างทุกคน </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_79" GroupName="a0502"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_80"  GroupName="a0502"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_81"  GroupName="a0502"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_27" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. กำหนดให้ลูกจ้างที่ทำงานครบ 1 ปี มีสิทธิหยุดพักผ่อนประจำปี ได้ไม่น้อยกว่าปีละ 6 วันทำงาน โดยได้รับค่าจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_82" GroupName="a0503"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_83"  GroupName="a0503"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_84"  GroupName="a0503"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_28" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีนโยบาย / ประกาศ หรือระเบียบปฏิบัติที่แสดงว่าไม่มีการเลือกปฏิบัติและลูกจ้างได้รับรู้ทั่วกัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_85" GroupName="a0601"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_86"  GroupName="a0601"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_87"  GroupName="a0601"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_29" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;2. ประกาศรับสมัครงานไม่มีเกณฑ์เกี่ยวกับการเลือกปฏิบัติ เช่น ความแตกต่างในเรื่อง สัญชาติ เชื้อชาติ ศาสนา เพศ อายุ การติดเชื้อเอชไอวี  หรือการเป็นสมาชิกสหภาพแรงงาน ฯลฯ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_88" GroupName="a0602"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_89"  GroupName="a0602"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_90"  GroupName="a0602"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_30" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;3. มีการกำหนดข้อมูลที่ให้กรอกในใบสมัครงานเฉพาะข้อมูลเกี่ยวกับการศึกษา ประสบการณ์ และความสามารถ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_91" GroupName="a0603"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_92"  GroupName="a0603"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_93"  GroupName="a0603"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_31" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;4. มีการจ้างงานและจ่ายค่าตอบแทนลูกจ้างชายและหญิงเท่าเทียมกัน เช่น การกำหนดค่าจ้าง การเลื่อนตำแหน่ง  การเกษียณอายุ  ฯลฯ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_94" GroupName="a0604"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_95"  GroupName="a0604"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_96"  GroupName="a0604"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_32" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;5. มีการจัดสวัสดิการให้ลูกจ้างทุกคนเสมอภาคและเป็นธรรม โดยไม่นำเชื้อชาติ ศาสนา เพศ มาเป็นเกณฑ์การตัดสิน </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_97" GroupName="a0605"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_98"  GroupName="a0605"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_99"  GroupName="a0605"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_33" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;6. กรณีการเลิกจ้าง ต้องมีกระบวนการพิจารณาอย่างเป็นธรรม สอดคล้องตามระเบียบข้อบังคับเกี่ยวกับการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_100" GroupName="a0606"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_101"  GroupName="a0606"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_102"  GroupName="a0606"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_34" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;7. มีระเบียบ/มีการปฏิบัติที่แสดงว่าไม่เลือกปฏิบัติต่อหญิงมีครรภ์ เช่น มีการรับลูกจ้างหญิงมีครรภ์เข้าทำงาน หรือเลิกจ้างลูกจ้างหญิงเพราะเหตุมีครรภ์</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_103" GroupName="a0607"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_104"  GroupName="a0607"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_105"  GroupName="a0607"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_35" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;8. มีการกำหนดเกณฑ์การเกษียณอายุลูกจ้างชายและหญิงเท่าเทียมกัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_106" GroupName="a0608"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_107"  GroupName="a0608"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_108"  GroupName="a0608"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_36" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;9. มีช่องทางการร้องเรียนกรณีลูกจ้างถูกเลือกปฏิบัติ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_109" GroupName="a0609"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_110"  GroupName="a0609"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_111"  GroupName="a0609"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_37" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;10. มีการจ้างงานคนพิการ หรือส่งเงินเข้ากองทุนแทนการจ้างงาน  หรือจัดพื้นที่ให้คนพิการจำหน่ายสินค้า</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_112" GroupName="a0610"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_113"  GroupName="a0610"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_114"  GroupName="a0610"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_38" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>7.วินัยและการลงโทษ    (ข้อกำหนด 4.8)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีข้อบังคับเกี่ยวกับการทำงานในเรื่องวินัยและการลงโทษ และลูกจ้างได้รับรู้ทั่วกัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_115" GroupName="a0701"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_116"  GroupName="a0701"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_117"  GroupName="a0701"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_39" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;2. มีข้อบังคับ/หรือการปฏิบัติที่แสดงว่าไม่มีการหักค่าจ้างหรือการลดค่าจ้างเพื่อการลงโทษทางวินัย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_118" GroupName="a0702"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_119"  GroupName="a0702"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_120"  GroupName="a0702"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_40" runat="server"></asp:TextBox></td>
          </tr>
           <tr>
            <td height="30">&nbsp;3. มีมาตรการมิให้ลูกจ้างถูกล่วงเกิน คุกคาม หรือก่อความเดือดร้อนรำคาญทางเพศ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_121" GroupName="a0703"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_122"  GroupName="a0703"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_123"  GroupName="a0703"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_41" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>8.การล่วงเกินทางเพศและการ   ใช้ความรุนแรง (ข้อกำหนด 4.9)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีมาตรการป้องกัน และแก้ไขปัญหาลูกจ้างถูกคุกคาม ล่วงเกิน หรือได้รับความเดือดร้อน รำคาญทางเพศ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_124" GroupName="a0801"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_125"  GroupName="a0801"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_126"  GroupName="a0801"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_42" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;2. มีมาตรการป้องกัน และยุติการใช้ความรุนแรงในสถานประกอบกิจการ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_127" GroupName="a0802"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_128"  GroupName="a0802"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_129"  GroupName="a0802"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_43" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>9.การใช้แรงงานเด็ก    (ข้อกำหนด 4.10)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ ไม่ว่าจ้าง หรือไม่สนับสนุนให้มีการจ้างแรงงานเด็กที่ผิดกฎหมาย ทุกรูปแบบ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_130" GroupName="a0901"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_131"  GroupName="a0901"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_132"  GroupName="a0901"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_44" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;2. มีทะเบียนหรือแฟ้มประวัติลูกจ้างแสดงถึงอายุลูกจ้างทุกคนไม่ต่ำกว่า 15 ปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_133" GroupName="a0902"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_134"  GroupName="a0902"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_135"  GroupName="a0902"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_45" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. มีมาตรการควบคุมลูกจ้างอายุต่ำกว่า 18 ปี ไม่ให้ทำงานอันตรายหรืออยู่ในภาวะแวดล้อมที่อาจก่อให้เกิดอันตรายหรือทำงาน ระหว่างเวลา 22.00 – 06.00 น. หรือทำงานล่วงเวลา หรือทำงานในงานบรรทุกหรือขนถ่ายสินค้าเรือเดินทะเล</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_136" GroupName="a0903"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_137"  GroupName="a0903"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_138"  GroupName="a0903"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_46" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;4. มีบันทึกสภาพการจ้างลูกจ้างเด็ก และมีการแจ้งการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_139" GroupName="a0904"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_140"  GroupName="a0904"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_141"  GroupName="a0904"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_47" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;5. มีการแจ้งสิ้นสุดการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_142" GroupName="a0905"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_143"  GroupName="a0905"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_144"  GroupName="a0905"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_48" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;6. ลูกจ้างเด็กมีเวลาพักระหว่างการทำงาน 4 ชั่วโมงแรก และได้พักไม่น้อยกว่า 1 ชั่วโมงหลังทำงานมาแล้วไม่เกิน 4 ชั่วโมง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_145" GroupName="a0906"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_146"  GroupName="a0906"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_147"  GroupName="a0906"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_49" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;7. มีระเบียบ ข้อบังคับ หรือการปฏิบัติที่แสดงว่าไม่มีการเรียกหลักประกันจากลูกจ้างเด็กและไม่จ่ายค่าจ้างของลูกจ้างเด็กให้แก่บุคคลอื่น และไม่มีการนำผลประโยชน์ใดที่จ่ายให้ล่วงหน้าก่อนการจ้างมาหักจากค่าจ้างของลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_148" GroupName="a0907"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_149"  GroupName="a0907"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_150"  GroupName="a0907"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_50" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;8. ลูกจ้างเด็กมีสิทธิเพื่อการพัฒนา เช่น ประชุม สัมมนา ฝึกอบรม  และมีการจ่ายค่าจ้างเพื่อการพัฒนาปีละไม่เกิน 30 วัน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_151" GroupName="a0908"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_152"  GroupName="a0908"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_153"  GroupName="a0908"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_51" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีนโยบายสนับสนุน และส่งเสริมการเลี้ยงลูกด้วยนมแม่ในสถานประกอบกิจการ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_154" GroupName="a1001"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_155"  GroupName="a1001"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_156"  GroupName="a1001"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_52" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;2. มีประกาศอนุญาตให้ลูกจ้างหญิงพักเพื่อเก็บน้ำนมในช่วงให้นมบุตร โดยให้นับเป็นเวลาทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_157" GroupName="a1002"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_158"  GroupName="a1002"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_159"  GroupName="a1002"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_53" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. มีมาตรการควบคุมหรือระเบียบปฏิบัติไม่ให้ลูกจ้างหญิงตั้งครรภ์ ทำงานอย่างใดอย่างหนึ่งตามที่กฎหมายกำหนด และไม่มีการทำงานระหว่างเวลา 22.00-06.00 น. และไม่ให้ทำงานล่วงเวลายกเว้นงานที่กฎหมายกำหนด ซึ่งไม่มีผลกระทบต่อสุขภาพของลูกจ้าง และไม่มีการทำงานในวันหยุด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_160" GroupName="a1003"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_161"  GroupName="a1003"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_162"  GroupName="a1003"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_54" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;4. ลูกจ้างหญิงตั้งครรภ์มีสิทธิเปลี่ยนงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_163" GroupName="a1004"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_164"  GroupName="a1004"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_165"  GroupName="a1004"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_55" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;5. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ การไม่เลิกจ้าง ลดตำแหน่ง หรือสิทธิประโยชน์เพราะเหตุ จากการมีครรภ์ </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_166" GroupName="a1005"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_167"  GroupName="a1005"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_168"  GroupName="a1005"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_56" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;6. ลูกจ้างหญิงมีสิทธิลาคลอดได้ 98 วัน โดยได้รับค่าจ้างไม่น้อยกว่า 45 วัน มีการจัดมุมนมแม่ โดยมีการจัดสถานที่และอุปกรณ์</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_169" GroupName="a1006"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_170"  GroupName="a1006"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_171"  GroupName="a1006"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_57" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีการปฏิบัติที่แสดงว่าไม่มีการแทรกแซงขัดขวางการรวมตัวเพื่อจัดตั้งองค์กรของลูกจ้างหรือการเจรจาต่อรอง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_172" GroupName="a1101"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_173"  GroupName="a1101"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_174"  GroupName="a1101"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_58" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;2. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างหรือกระทำการอันเป็นผลให้ลูกจ้างไม่สามารถทนทำงานต่อไปได้เพราะเหตุที่ลูกจ้างยื่นข้อเรียกร้องเจรจาหรือเข้าเป็นสมาชิกสหภาพแรงงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_175" GroupName="a1102"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_176"  GroupName="a1102"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_177"  GroupName="a1102"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_59" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. มีการปฏิบัติที่แสดงว่าไม่มีการขัดขวางแทรกแซงการดำเนินงานของสหภาพแรงงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_178" GroupName="a1103"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_179"  GroupName="a1103"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_180"  GroupName="a1103"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_60" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;4. มีการเจรจาต่อรองหรือพูดคุยกันกับผู้แทนลูกจ้างหรือองค์กรลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_181" GroupName="a1104"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_182"  GroupName="a1104"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_183"  GroupName="a1104"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_61" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;5. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างลงโทษ หรือขัดขวางการปฏิบัติหน้าที่ของกรรมการลูกจ้างเว้นแต่ได้รับอนุญาตจากศาลแรงงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_184" GroupName="a1105"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_185"  GroupName="a1105"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_186"  GroupName="a1105"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_62" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;6. มีการปฏิบัติที่เป็นธรรม ต่อผู้แทนลูกจ้างหรือลูกจ้างที่เป็นสมาชิกของสหภาพแรงงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_187" GroupName="a1106"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_188"  GroupName="a1106"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_189"  GroupName="a1106"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_63" runat="server"></asp:TextBox></td>
          </tr>


          <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีนโยบายด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_190" GroupName="a1201"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_191"  GroupName="a1201"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_192"  GroupName="a1201"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_64" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td style="height: 30px">&nbsp;2. มีโครงสร้างการบริหารด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน</td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_193" GroupName="a1202"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_194"  GroupName="a1202"   runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_195"  GroupName="a1202"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:TextBox ID="txt_input_65" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;3. มีแผนงานด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้มในการทำงาน และการนำไปปฏิบัติ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_196" GroupName="a1203"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_197"  GroupName="a1203"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_198"  GroupName="a1203"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_66" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;4. มีการประเมินผลและทบทวนการจัดการด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_199" GroupName="a1204"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_200"  GroupName="a1204"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_201"  GroupName="a1204"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_67" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;5. มีการดำเนินการปรับปรุงด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_202" GroupName="a1205"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_203"  GroupName="a1205"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_204"  GroupName="a1205"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_68" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;6. มีประกาศให้ลูกจ้างทราบ เรื่อง สิทธิ ขั้นตอนการปฏิเสธการทำงานที่ไม่มีมาตรการด้านความปลอดภัย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_205" GroupName="a1206"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_206"  GroupName="a1206"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_207"  GroupName="a1206"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_69" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;7. มีการติดข้อความแสดงสิทธิและหน้าที่ของนายจ้างและลูกจ้างเกี่ยวกับความปลอดภัยในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_208" GroupName="a1207"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_209"  GroupName="a1207"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_210"  GroupName="a1207"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_70" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;8. มีข้อบังคับ และคู่มือว่าด้วยความปลอดภัยในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_211" GroupName="a1208"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_212"  GroupName="a1208"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_213"  GroupName="a1208"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_71" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;9. มีการติดประกาศสัญลักษณ์เตือนอันตรายและเครื่องหมายเกี่ยวกับความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน รวมทั้งข้อความแสดงสิทธิของนายจ้างและลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_214" GroupName="a1209"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_215"  GroupName="a1209"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_216"  GroupName="a1209"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_72" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;10. มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการความปลอดภัยอาชีวอนามัย และสภาพแวดล้อมในการทำงาน (กรณีมีลูกจ้างตั้งแต่  50  คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_217" GroupName="a1210"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_218"  GroupName="a1210"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_219"  GroupName="a1210"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_73" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;11. คณะกรรมการความปลอดภัยฯ ได้รับการอบรมเกี่ยวกับบทบาทหน้าที่ตามกฎหมายครบทุกคน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_220" GroupName="a1211"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_221"  GroupName="a1211"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_222"  GroupName="a1211"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_74" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;12. คณะกรรมการความปลอดภัยฯมีการประชุม อย่างน้อยเดือนละ 1 ครั้ง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_223" GroupName="a1212"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_224"  GroupName="a1212"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_225"  GroupName="a1212"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_75" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;13. หัวหน้างานได้รับการฝึกอบรมและแต่งตั้งเป็น จป.หัวหน้างานครบทุกคน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_226" GroupName="a1213"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_227"  GroupName="a1213"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_228"  GroupName="a1213"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_76" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;14. ผู้บริหารได้รับการฝึกอบรมและแต่งตั้ง เป็น จป.บริหารครบทุกคน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_229" GroupName="a1214"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_230"  GroupName="a1214"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_231"  GroupName="a1214"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_77" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;15. มี จป.ระดับเทคนิค/เทคนิคชั้นสูง/วิชาชีพ ตามที่กฎหมายกำหนด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_232" GroupName="a1215"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_233"  GroupName="a1215"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_234"  GroupName="a1215"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_78" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;16. มีการจัดตั้งหน่วยงานความปลอดภัยอาชีวอนามัยและสภาพแวดล้อมในการทำงานของสถานประกอบกิจการ (กรณีมีลูกจ้างตั้งแต่ 200  คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_235" GroupName="a1216"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_236"  GroupName="a1216"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_237"  GroupName="a1216"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_79" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;17. หน่วยงานความปลอดภัยขึ้นตรงต่อผู้บริหารสูงสุด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_238" GroupName="a1217"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_239"  GroupName="a1217"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_240"  GroupName="a1217"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_80" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;18. ลูกจ้างทุกคนได้รับการฝึกอบรมความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_241" GroupName="a1218"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_242"  GroupName="a1218"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_243"  GroupName="a1218"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_81" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;19. มีการติดตั้งเครื่องป้องกันอันตรายจากเครื่องจักรอย่างครบถ้วน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_244" GroupName="a1219"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_245"  GroupName="a1219"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_246"  GroupName="a1219"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_82" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;20. มีการตรวจสอบสายไฟฟ้าและอุปกรณ์ไฟฟ้าประจำปีโดยวิศวกร</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_247" GroupName="a1220"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_248"  GroupName="a1220"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_249"  GroupName="a1220"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_83" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;21. มีการซ่อมแซมตรวจสอบหรือติดตั้งอุปกรณ์ไฟฟ้าพร้อมสายดินอย่างครบถ้วน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_250" GroupName="a1221"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_251"  GroupName="a1221"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_252"  GroupName="a1221"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_84" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;22. มีการทดสอบส่วนประกอบและอุปกรณ์ปั้นจั่นทุกเครื่องตามที่กฎหมายกำหนด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_253" GroupName="a1222"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_254"  GroupName="a1222"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_255"  GroupName="a1222"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_85" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;23. มีการทดสอบหม้อน้ำประจำปีโดยวิศวกร และผู้ควบคุมหม้อน้ำผ่านการอบรมครบทุกคน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_256" GroupName="a1223"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_257"  GroupName="a1223"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_258"  GroupName="a1223"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_86" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;24. มีตรวจสอบสภาพลิฟต์ขนส่งประจำปีโดยวิศวกร</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_259" GroupName="a1224"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_260"  GroupName="a1224"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_261"  GroupName="a1224"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_87" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;25. มีแผนป้องกัน และระงับอัคคีภัย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_262" GroupName="a1225"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_263"  GroupName="a1225"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_264"  GroupName="a1225"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_88" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;26. มีลูกจ้างผ่านการอบรมหลักสูตรการดับเพลิงขั้นต้นไม่น้อยกว่าร้อยละ 40 ของจำนวนลูกจ้างในแต่ละหน่วยงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_265" GroupName="a1226"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_266"  GroupName="a1226"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_267"  GroupName="a1226"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_89" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;27. ลูกจ้างทุกคนได้รับการฝึกซ้อมดับเพลิงและอพยพหนีไฟเป็นประจำทุกปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_268" GroupName="a1227"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_269"  GroupName="a1227"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_270"  GroupName="a1227"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_90" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;28. มีแผนการตรวจสอบอุปกรณ์ดับเพลิง และมีการตรวจสอบตามแผนที่กำหนด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_271" GroupName="a1228"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_272"  GroupName="a1228"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_273"  GroupName="a1228"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_91" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;29. มีระบบน้ำดับเพลิงและอุปกรณ์และอุปกรณ์ประกอบเพื่อใช้ในการดับเพลิง ได้แก่  ปั๊มน้ำ ข้อต่อสายส่งน้ำดับเพลิง และสายส่งน้ำดับเพลิง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_274" GroupName="a1229"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_275"  GroupName="a1229"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_276"  GroupName="a1229"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_92" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;30. มีการตรวจวัดและวิเคราะห์สภาวะการทำงานเกี่ยวกับระดับความร้อนแสงสว่าง และเสียง เป็นประจำทุกปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_277" GroupName="a1230"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_278"  GroupName="a1230"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_279"  GroupName="a1230"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_93" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;31. มีการตรวจสอบอุปกรณ์แสดงอุณหภูมิในห้องเย็น และมีการกำหนดระยะเวลาการทำงานของลูกจ้างในห้องเย็นอย่างปลอดภัย </td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_280" GroupName="a1231"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_281"  GroupName="a1231"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_282"  GroupName="a1231"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_94" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;32. มีสัญญาณแจ้งเหตุฉุกเฉิน  ประตูมีระบบเปิดจากด้านใน และมีการจัดชุดปฏิบัติที่เหมาะ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_283" GroupName="a1232"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_284"  GroupName="a1232"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_285"  GroupName="a1232"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_95" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;33. มีการจัดและดูแลให้ลูกจ้างสวมใส่อุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคลตามสภาพและลักษณะของงานตลอดระยะเวลาทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_286" GroupName="a1233"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_287"  GroupName="a1233"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_288"  GroupName="a1233"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_96" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;34. มีการตรวจวัดภาวะแวดล้อมสารเคมีในอากาศ (ปริมาณฝุ่น/สารเคมีที่ฟุ้งกระจาย)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_289" GroupName="a1234"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_290"  GroupName="a1234"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_291"  GroupName="a1234"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_97" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;35. มีการแจ้งบัญชีรายชื่อสารเคมีอันตราย และรายละเอียดข้อความปลอดภัยของสารเคมีอันตรายที่มีอยู่ในครอบครอง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_292" GroupName="a1235"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_293"  GroupName="a1235"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_294"  GroupName="a1235"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_98" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;36. มีการแจ้งลูกจ้างที่ทำงานเกี่ยวกับการสารเคมีอันตรายทราบและเข้าใจวิธีการทำงานที่ถูกต้องและปลอดภัย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_295" GroupName="a1236"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_296"  GroupName="a1236"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_297"  GroupName="a1236"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_99" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;37. มีการจัดทำคู่มือเกี่ยวกับการปฏิบัติ และขั้นตอนการทำงานเกี่ยวกับสารเคมีอันตราย</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_298" GroupName="a1237"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_299"  GroupName="a1237"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_300"  GroupName="a1237"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_100" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;38. มีการปิดประกาศหรือจัดทำป้ายแจ้งข้อความ “ห้ามสูบบุหรี่ หรือรับประทานอาหาร หรือเครื่องดื่ม ประกอบอาหาร หรือเก็บอาหาร”</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_301" GroupName="a1238"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_302"  GroupName="a1238"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_303"  GroupName="a1238"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_101" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;39. มีป้ายแจ้งข้อความ “ที่อับอากาศ อันตราย ห้ามเข้า” ติดตั้งไว้โดยเปิดเผยบริเวณที่เข้าออกทางอับอากาศทุกแห่ง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_304" GroupName="a1239"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_305"  GroupName="a1239"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_306"  GroupName="a1239"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_102" runat="server"></asp:TextBox></td>
          </tr>

          <tr>
            <td height="30">&nbsp;40. มีการฝึกอบรมความปลอดภัยฯ ในที่อับอากาศ ให้กับผู้มีหน้าที่รับผิดชอบในการอนุญาต ผู้ควบคุมงาน ผู้ช่วยเหลือ และผู้ปฏิบัติงาน ในที่อับอากาศ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_310" GroupName="a1240"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_311"  GroupName="a1240"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_312"  GroupName="a1240"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_104" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;41. มีหนังสืออนุญาตให้ลูกจ้างทำงานในที่อับอากาศ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_313" GroupName="a1241"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_314"  GroupName="a1241"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_315"  GroupName="a1241"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_105" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;42. มีการกำหนดพื้นที่ควบคุมโดยจัดทำรั้ว คอกกั้นหรือเส้นแสดงแนวเขตและจัดให้มีป้ายข้อความ“ระวังอันตรายจากรังสี ห้ามเข้า”</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_316" GroupName="a1242"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_317"  GroupName="a1242"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_318"  GroupName="a1242"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_106" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;43. มีผู้รับผิดชอบดำเนินการทางด้านเทคนิคในเรื่องรังสีตลอดระยะเวลาที่มีการทำงานเกี่ยวกับรังสีอย่างน้อย 1 คน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_319" GroupName="a1243"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_320"  GroupName="a1243"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_321"  GroupName="a1243"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_107" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30">&nbsp;44. มีแผนป้องกันและระงับอันตรายจากรังสี และมีการฝึกซ้อมตามแผน อย่างน้อยปีละ 1 ครั้ง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_322" GroupName="a1244"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_323"  GroupName="a1244"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_324"  GroupName="a1244"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_108" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td style="height: 30px">&nbsp;45. มีการตรวจสุขภาพลูกจ้างใหม่ที่ทำงานเกี่ยวกับปัจจัยเสี่ยง ภายใน 30 วัน และตรวจครั้งต่อไปอย่างน้อยปีละ 1 ครั้ง</td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_325" GroupName="a1245"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_326"  GroupName="a1245"   runat="server" /></td>
            <td align="center" style="height: 30px"><asp:RadioButton ID="rbt_327"  GroupName="a1245"  runat="server" /></td>
            <td align="center" style="height: 30px"><asp:TextBox ID="txt_input_109" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;46. จัดให้มีสมุดสุขภาพประจำตัวของลูกจ้างที่ทำงานเกี่ยวกับปัจจัยเสี่ยง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_328" GroupName="a1246"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_329"  GroupName="a1246"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_330"  GroupName="a1246"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_110" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;47. ได้ส่งรายงาน จผส.๑ในกรณีผลการตรวจสุขภาพของลูกจ้างพบความผิดปกติหรือพบว่ามีลูกจ้างเจ็บป่วยเนื่องจากการทำงาน</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_331" GroupName="a1247"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_332"  GroupName="a1247"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_333"  GroupName="a1247"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_111" runat="server"></asp:TextBox></td>
          </tr>

                    <tr>
            <td height="30" colspan="5" bgcolor="#F4F4F4"><strong>13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)</strong></td>
          </tr>
          <tr>
            <td height="30">&nbsp;1. มีห้องอาบน้ำถูกต้องตามสุขลักษณะ และมีจำนวนเพียงพอสำหรับลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_307" GroupName="a1301"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_308"  GroupName="a1301"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_309"  GroupName="a1301"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_103" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;2. มีการแยกห้องอาบน้ำระหว่างลูกจ้างชายและหญิง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_334" GroupName="a1302"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_335"  GroupName="a1302"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_336"  GroupName="a1302"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_112" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;3. มีห้องส้วมถูกต้องตามสุขลักษณะ และมีจำนวนเพียงพอสำหรับลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_337" GroupName="a1303"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_338"  GroupName="a1303"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_339"  GroupName="a1303"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_113" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;4. มีการแยกห้องส้วมระหว่างลูกจ้างชายและลูกจ้างหญิง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_340" GroupName="a1304"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_341"  GroupName="a1304"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_342"  GroupName="a1304"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_114" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;5. มีกระดาษชำระหรือน้ำสำหรับชำระล้าง และมีกำหนดผู้รับผิดชอบการทำความสะอาด</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_343" GroupName="a1305"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_344"  GroupName="a1305"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_345"  GroupName="a1305"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_115" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;6. มีผลการตรวจคุณภาพน้ำดื่มและมีปริมาณเพียงพอสำหรับลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_346" GroupName="a1306"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_347"  GroupName="a1306"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_348"  GroupName="a1306"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_116" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;7. มีปัจจัยการปฐมพยาบาลตามที่กฎหมายกำหนด และมีทะเบียนควบคุมรายการปัจจัยการปฐมพยาบาล</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_349" GroupName="a1307"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_350"  GroupName="a1307"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_351"  GroupName="a1307"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_117" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;8. มีสถานที่รับประทานอาหารสะอาดและถูกหลักสุขาภิบาล</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_352" GroupName="a1308"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_353"  GroupName="a1308"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_354"  GroupName="a1308"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_118" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;9. มีสถานที่เก็บอาหารที่สะอาดและถูกหลักสุขาภิบาล</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_355" GroupName="a1309"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_356"  GroupName="a1309"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_357"  GroupName="a1309"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_119" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;10. มีมาตรการควบคุมสุขอนามัยของผู้ปรุงอาหาร เช่น การจัดให้มีการตรวจสุขภาพประจำปี</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_358" GroupName="a1310"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_359"  GroupName="a1310"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_360"  GroupName="a1310"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_120" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;11. มีห้องรักษาพยาบาลพร้อมเตียงพักคนไข้  เวชภัณฑ์และยาเพียงพอแก่การรักษาพยาบาลเบื้องต้น (กรณีมีลูกจ้างตั้งแต่  200  คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_361" GroupName="a1311"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_362"  GroupName="a1311"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_363"  GroupName="a1311"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_121" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;12. มีพยาบาลตั้งแต่ระดับพยาบาลเทคนิคขึ้นไปประจำตลอดเวลาทำงาน (กรณีมีลูกจ้างตั้งแต่  200  คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_364" GroupName="a1312"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_365"  GroupName="a1312"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_366"  GroupName="a1312"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_122" runat="server"></asp:TextBox></td>
          </tr>
                    <tr>
            <td height="30">&nbsp;13. มีแพทย์แผนปัจจุบันชั้นหนึ่ง หรือมีสัญญากับโรงพยาบาลแทนการจัดให้มีแพทย์ (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_367" GroupName="a1313"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_368"  GroupName="a1313"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_369"  GroupName="a1313"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_123" runat="server"></asp:TextBox></td>
          </tr>
          <%--****มี List down******--%>
                    <tr>
            <td height="30">&nbsp;14. กรณีมีการจัดที่พักอาศัยให้กับลูกจ้าง  </td>
            <td height="30" align="center" colspan  = "5"></td>
            </tr> 
                             <tr>
            <td height="30">&nbsp;&emsp;&emsp;&emsp;1) มีความเป็นสัดส่วนแยกระหว่างลูกจ้างชายและลูกจ้างหญิง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_370" GroupName="a13141"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_371"  GroupName="a13141"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_372"  GroupName="a13141"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_124" runat="server"></asp:TextBox></td>
          </tr>
                                <tr>
            <td height="30">&nbsp;&emsp;&emsp;&emsp;2) มีอุปกรณ์ เครื่องใช้เพื่อให้ลูกจ้างพักผ่อนนอนหลับได้สุขสบายตามสภาพ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_373" GroupName="a13142"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_374"  GroupName="a13142"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_375"  GroupName="a13142"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_126" runat="server"></asp:TextBox></td>
          </tr>
                              <tr>
            <td height="30">&nbsp;&emsp;&emsp;&emsp;3) มีการทำความสะอาดที่พักอยู่เป็นประจำ</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_376" GroupName="a13143"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_377"  GroupName="a13143"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_378"  GroupName="a13143"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_127" runat="server"></asp:TextBox></td>
          </tr>
                              <tr>
            <td height="30">&nbsp;&emsp;&emsp;&emsp;4) มีการรักษาความปลอดภัยให้กับลูกจ้าง</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_379" GroupName="a13144"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_380"  GroupName="a13144"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_381"  GroupName="a13144"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_128" runat="server"></asp:TextBox></td>
          </tr>
           <%--**********--%>
                    <tr>
            <td height="30">&nbsp;15. มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการสวัสดิการในสถานประกอบกิจการ  จำนวนไม่น้อยกว่า 5 คน (กรณีมีลูกจ้างตั้งแต่  50  คนขึ้นไป)</td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_382" GroupName="a1315"  runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_383"  GroupName="a1315"   runat="server" /></td>
            <td height="30" align="center"><asp:RadioButton ID="rbt_384"  GroupName="a1315"  runat="server" /></td>
            <td height="30" align="center"><asp:TextBox ID="txt_input_125" runat="server"></asp:TextBox></td>
          </tr>
          <tr>
            <td height="30" colspan= 5 >&nbsp;</td>

          </tr>
          
        </table>
        <br>  
        
        <table width="1024px"  align="center"  cellspacing="1">
          <tr>
            <td style="width: 174px"><b> ลงชื่อผู้ตอบรับเอกสาร  </b></td>
            <td style="padding-bottom: 5px" colspan="2"><asp:TextBox ID="txtRemark_2" Rows ="3" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="** ระบุ เป็น ชื่อ - นามสกุล"></asp:Label></td>
          </tr>
          <tr>
            <td style="width: 174px; height: 54px"> <b> หมายเหตุ  </b></td>
            <td style="padding-top: 5px; height: 54px" colspan="2"><asp:TextBox ID="txtRemark_3" Rows ="3" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="center" colspan="3"> 
            <br />
                <asp:Button ID="btSave"   class="btn btn-primary" runat="server" Text="บันทึก/SAVE" Visible="False" />
                <asp:Button ID="btCancel"   class="btn btn-primary" runat="server" Text="ยกเลิก/CANCEL" Visible="False" />
                      
                <asp:Button ID="btSave0"   class="btn btn-primary" runat="server"  
                    Text="บันทึก/SAVE" Visible="False" />
                      
            </td>
          </tr>
        </table>      
        <b> </b>        
          <br />
   
      </form>

      <br />
    </div>
  </div>
</div>

</body>
</html>
