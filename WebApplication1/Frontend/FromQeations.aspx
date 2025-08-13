<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/FromMaster.Master" CodeBehind="FromQeations.aspx.vb" Inherits="WebApplication1.FromQeations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // ===== helpers =====
        const LS_PREFIX = 'formcache:';
        const keyForRadioGroup = (groupName) => `${LS_PREFIX}rb:${groupName}`;
        const keyForNote = (id) => `${LS_PREFIX}note:${id}`;

        function saveRadio(groupName, value) {
            localStorage.setItem(keyForRadioGroup(groupName), value);
            console.log(`✅ saved local rb[${groupName}] = ${value}`);
        }

        function loadRadio(groupName) {
            const v = localStorage.getItem(keyForRadioGroup(groupName));
            console.log(v === null ? `⚠️ no local rb for ${groupName}` : `📦 loaded local rb[${groupName}] = ${v}`);
            return v;
        }

        function saveNote(id, val) {
            localStorage.setItem(keyForNote(id), val ?? '');
            console.log(`✅ saved local note[${id}] length=${(val || '').length}`);
        }

        function loadNote(id) {
            const v = localStorage.getItem(keyForNote(id));
            console.log(v === null ? `⚠️ no local note for ${id}` : `📦 loaded local note[${id}] length=${v.length}`);
            return v;
        }

        function wireUpSection(sectionEl) {
            // radios
            const radios = sectionEl.querySelectorAll('input[type="radio"]');
            const groupNames = Array.from(new Set(Array.from(radios).map(r => r.name)));

            // restore
            groupNames.forEach(groupName => {
                const saved = loadRadio(groupName);
                if (!saved) return;
                const targetWrapper = sectionEl.querySelector(`.detail-quations[data-answer="${CSS.escape(saved)}"]`);
                const targetRadio = targetWrapper?.querySelector(`input[type="radio"][name="${CSS.escape(groupName)}"]`);
                if (targetRadio) targetRadio.checked = true;
            });

            // save on change
            radios.forEach(rb => {
                const wrap = rb.closest('.detail-quations');
                const answer = wrap?.dataset.answer || '';
                if (wrap) {
                    wrap.addEventListener('click', (e) => {
                        if (e.target.tagName !== 'INPUT') rb.checked = true;
                        rb.dispatchEvent(new Event('change', { bubbles: true }));
                    });
                }
                rb.addEventListener('change', () => {
                    if (rb.checked) saveRadio(rb.name, answer);
                });
            });

            // note
            const note = sectionEl.querySelector('[data-note="true"]');
            if (note) {
                const savedNote = loadNote(note.id);
                if (savedNote !== null) note.value = savedNote;
                let t;
                note.addEventListener('input', () => {
                    clearTimeout(t);
                    t = setTimeout(() => saveNote(note.id, note.value), 150);
                });
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('.section-from').forEach(sec => wireUpSection(sec));
        });

        function softRefreshUI() {
            document.querySelectorAll('.section-from').forEach(sec => {
                sec.querySelectorAll('input[type="radio"]').forEach(r => r.checked = false);
                sec.querySelectorAll('[data-note="true"]').forEach(t => t.value = '');
            });
            console.log('🔄 soft refresh: cleared UI without full reload');
        }

        window.clearLocalAnswers = function () {
            Object.keys(localStorage)
                .filter(k => k.startsWith(LS_PREFIX))
                .forEach(k => localStorage.removeItem(k));
            console.log('🧹 cleared all local formcache');

            softRefreshUI();
        };

        // Removed the fetch call and using local data instead.
        document.addEventListener("DOMContentLoaded", function () {
            const userId = document.getElementById("hfUid").value;
            console.log("Session user ID:", userId);

            if (userId) {
                // Use session/local storage data if available, else handle logic here.
                // Just a placeholder response in case there's no backend.
                const data = { message: "Data loaded successfully (fetched from local)" };
                console.log("📦 Data loaded successfully:", data);
                // Process data as needed
            } else {
                console.warn("⚠️ No user ID found in session.");
            }
        });

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center">
        <div class="vw-75 overflow-auto">
            <div class="d-flex justify-content-center">
                <div class="d-flex flex-column justify-content-center">
                    <h3 class="d-flex justify-content-center">
                        <asp:label cssclass="text-black" font-bold="true" forecolor="Blue" id="lblCompany"
                            runat="server" text="ชื่อสถานประกอบการ  "></asp:label>
                    </h3>
                    <h3 class="d-flex justify-content-center align-items-center p-4">TLS8001/Sa08000 -
                        แบบสอบถามการประเมินตัวเอง
                        (ผู้ส่งมอบ/ผู้รับเหมาช่วง)</h3>
                    <div class="border border-secondary p-2 pt-5">
                        <asp:hiddenfield id="hdfTlsId" runat="server"></asp:hiddenfield>
                        <asp:hiddenfield id="hdfSupplierId" runat="server"></asp:hiddenfield>
                        <asp:HiddenField ID="hfUid" runat="server" ClientIDMode="Static" />
                        <div align="center" cellpadding="0" cellspacing="0" class="p-4" id="tblCustomers"
                            width="1024px">
                            <div class="d-flex justify-content-between">
                                <div class="text-center w-50"><strong>รายการ</strong></div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>1.ข้อกำหนดทั่วไป
                                        (ข้อกำหนด 4.1)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0101"
                                data-question="1. มีเอกสารตามที่กฎหมายแรงงานกำหนด ได้แก่ข้อบังคับเกี่ยวกับการทำงาน ทะเบียนลูกจ้าง"
                                data-section="1.ข้อกำหนดทั่วไป (ข้อกำหนด 4.1)">
                                <div class="detail-quations-main">
                                    1. มีเอกสารตามที่กฎหมายแรงงานกำหนด
                                    ได้แก่ข้อบังคับเกี่ยวกับการทำงาน ทะเบียนลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0101" id="rbt_1" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0101" id="rbt_2" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0101" id="rbt_3" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_1" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>2.
                                        การบังคับใช้แรงงาน (ข้อกำหนด 4.3)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0201"
                                data-question="1. มีนโยบาย/ประกาศ/ระเบียบ ห้ามมีการบังคับใช้แรงงานในทุกรูปแบบและไม่เข้าไปมีส่วนร่วมในการใช้แรงงานผิดกฎหมาย"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย/ประกาศ/ระเบียบ
                                    ห้ามมีการบังคับใช้แรงงานในทุกรูปแบบและไม่เข้าไปมีส่วนร่วมในการใช้แรงงานผิดกฎหมาย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0201" id="rbt_4" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0201" id="rbt_5" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0201" id="rbt_6" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_2" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0202"
                                data-question="2. มีหลักฐานแสดงความยินยอมทำงานล่วงเวลาและทำงานในวันหยุดงานของลูกจ้าง"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    2.
                                    มีหลักฐานแสดงความยินยอมทำงานล่วงเวลาและทำงานในวันหยุดงานของลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0202" id="rbt_7" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0202" id="rbt_8" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0202" id="rbt_9" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_3" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0203"
                                data-question="3. มีการชี้แจง/ปฐมนิเทศเกี่ยวกับเงื่อนไขการจ้าง เงื่อนไขการทำงานให้ลูกจ้าง ที่เข้างานใหม่รับทราบ (ทั้งนี้ เงื่อนไขสภาพการจ้าง สภาพการทำงานต้องเป็นไปตามกฎหมายแรงงาน)"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    3. มีการชี้แจง/ปฐมนิเทศเกี่ยวกับเงื่อนไขการจ้าง
                                    เงื่อนไขการทำงานให้ลูกจ้าง ที่เข้างานใหม่รับทราบ (ทั้งนี้ เงื่อนไขสภาพการจ้าง
                                    สภาพการทำงานต้องเป็นไปตามกฎหมายแรงงาน)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0203" id="rbt_10" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0203" id="rbt_11" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0203" id="rbt_12" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_4" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0204"
                                data-question="4. ลูกจ้างสามารถลาออกจากงานได้ตามความต้องการ"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">4. ลูกจ้างสามารถลาออกจากงานได้ตามความต้องการ </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0204" id="rbt_13" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0204" id="rbt_14" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0204" id="rbt_15" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_5" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0205"
                                data-question="5. ลูกจ้างมีเสรีภาพในการเข้าออกสถานที่ทำงานได้ในกรณีที่มีกิจธุระและมีอิสระในการทำกิจส่วนตัว"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    5.
                                    ลูกจ้างมีเสรีภาพในการเข้าออกสถานที่ทำงานได้ในกรณีที่มีกิจธุระและมีอิสระในการทำกิจส่วนตัว
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0205" id="rbt_16" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0205" id="rbt_17" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0205" id="rbt_18" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_6" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0206"
                                data-question="6.ไม่มีการบีบบังคับลูกจ้าง เช่นหักเงินค่าจ้างเพื่อร่วมทำกิจกรรมที่จัดขึ้นในสถานประกอบกิจการ การยึดบัตรประจำตัวประชาชน การข่มขู่ ฯลฯ"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    6.ไม่มีการบีบบังคับลูกจ้าง
                                    เช่นหักเงินค่าจ้างเพื่อร่วมทำกิจกรรมที่จัดขึ้นในสถานประกอบกิจการ
                                    การยึดบัตรประจำตัวประชาชน การข่มขู่ ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0206" id="rbt_19" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0206" id="rbt_20" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0206" id="rbt_21" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_7" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0207"
                                data-question="7. ไม่มีการเรียกเก็บเงินประกันจากลูกจ้างยกเว้นกฎหมายกำหนดไว้"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    7.
                                    ไม่มีการเรียกเก็บเงินประกันจากลูกจ้างยกเว้นกฎหมายกำหนดไว้
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0207" id="rbt_22" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0207" id="rbt_23" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0207" id="rbt_24" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_8" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0208"
                                data-question="8. มีการวิธีการเก็บรักษาเงินประกันของลูกจ้างไว้ในธนาคารพาณิชย์หรือสถาบันการเงิน และมีการคืนเงิน ประกันภายใน 7 วัน เมื่อลูกจ้างลาออกหรือสิ้นสุดสัญญา"
                                data-section="2. การบังคับใช้แรงงาน (ข้อกำหนด 4.3)">
                                <div class="detail-quations-main">
                                    8.
                                    มีการวิธีการเก็บรักษาเงินประกันของลูกจ้างไว้ในธนาคารพาณิชย์หรือสถาบันการเงิน
                                    และมีการคืนเงิน ประกันภายใน 7 วัน เมื่อลูกจ้างลาออกหรือสิ้นสุดสัญญา
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0208" id="rbt_25" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0208" id="rbt_26" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0208" id="rbt_27" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_9" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>3.
                                        ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0301"
                                data-question="1. มีการจ่ายเงินค่าจ้างไม่ต่ำกว่าอัตราค่าจ้างขั้นต่ำ"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    1. มีการจ่ายเงินค่าจ้างไม่ต่ำกว่าอัตราค่าจ้างขั้นต่ำ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0301" id="rbt_28" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0301" id="rbt_29" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0301" id="rbt_30" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_10" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0302"
                                data-question="2.มีการจ่ายค่าล่วงเวลาในวันทำงานปกติและมีการจ่ายค่าล่วงเวลาในวันหยุดในอัตราไม่น้อยกว่า 1.5 เท่า และไม่น้อยกว่า 3 เท่าของอัตราค่าจ้างปกติ ตามลำดับ"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main" style="height: 30px">
                                    2.มีการจ่ายค่าล่วงเวลาในวันทำงานปกติและมีการจ่ายค่าล่วงเวลาในวันหยุดในอัตราไม่น้อยกว่า
                                    1.5 เท่า และไม่น้อยกว่า 3 เท่าของอัตราค่าจ้างปกติ ตามลำดับ </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0302" id="rbt_31" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0302" id="rbt_32" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0302" id="rbt_33" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_11" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0303"
                                data-question="3. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 1 เท่าของอัตราค่าจ้างปกติ กรณีลูกจ้างมีสิทธิได้รับค่าจ้างในวันหยุด"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    3. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 1
                                    เท่าของอัตราค่าจ้างปกติ กรณีลูกจ้างมีสิทธิได้รับค่าจ้างในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0303" id="rbt_34" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0303" id="rbt_35" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0303" id="rbt_36" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_12" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0304"
                                data-question="4. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 2 เท่าของอัตราค่าจ้างปกติ กรณีไม่มีสิทธิได้รับค่าจ้างในวันหยุด"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    4. มีการจ่ายค่าทำงานในวันหยุดไม่น้อยกว่า 2
                                    เท่าของอัตราค่าจ้างปกติ กรณีไม่มีสิทธิได้รับค่าจ้างในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0304" id="rbt_37" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0304" id="rbt_38" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0304" id="rbt_39" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_13" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0305"
                                data-question="5. มีการจ่ายค่าจ้าง ณ สถานที่ทำงานหรือสถานที่อื่นที่ลูกจ้างยินยอม"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    5. มีการจ่ายค่าจ้าง ณ
                                    สถานที่ทำงานหรือสถานที่อื่นที่ลูกจ้างยินยอม
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0305" id="rbt_40" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0305" id="rbt_41" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0305" id="rbt_42" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_14" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0306"
                                data-question="6. มีการจ่ายค่าจ้างตรงตามเวลาที่กำหนด"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">6. มีการจ่ายค่าจ้างตรงตามเวลาที่กำหนด </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0306" id="rbt_43" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0306" id="rbt_44" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0306" id="rbt_45" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_15" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0307"
                                data-question="7. มีเอกสารเกี่ยวกับการจ่ายค่าจ้าง แสดงให้ลูกจ้างทุกคนทราบ"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    7. มีเอกสารเกี่ยวกับการจ่ายค่าจ้าง
                                    แสดงให้ลูกจ้างทุกคนทราบ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0307" id="rbt_46" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0307" id="rbt_47" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0307" id="rbt_48" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_16" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0308"
                                data-question="8. มีการเก็บเอกสารเกี่ยวกับการจ่ายค่าจ้างไว้ไม่น้อยกว่า 2 ปี"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    8.
                                    มีการเก็บเอกสารเกี่ยวกับการจ่ายค่าจ้างไว้ไม่น้อยกว่า 2 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0308" id="rbt_49" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0308" id="rbt_50" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0308" id="rbt_51" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_17" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0309"
                                data-question="9. ไม่มีการหักค่าจ้างไม่ว่ากรณีใด ๆ ยกเว้นที่กฎหมายกำหนด"
                                data-section="3. ค่าตอบแทนการทำงาน (ข้อกำหนด 4.4)">
                                <div class="detail-quations-main">
                                    9. ไม่มีการหักค่าจ้างไม่ว่ากรณีใด ๆ
                                    ยกเว้นที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0309" id="rbt_52" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0309" id="rbt_53" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0309" id="rbt_54" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_18" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>4.
                                        ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0401"
                                data-question="1. มีการกำหนดเวลาทำงานปกติของลูกจ้างวันหนึ่งไม่เกิน 8 ชั่วโมง หรือ 48 ชั่วโมง/สัปดาห์"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    1. มีการกำหนดเวลาทำงานปกติของลูกจ้างวันหนึ่งไม่เกิน 8
                                    ชั่วโมง หรือ 48 ชั่วโมง/สัปดาห์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0401" id="rbt_55" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0401" id="rbt_56" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0401" id="rbt_57" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_19" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0402"
                                data-question="2. มีการทำงานล่วงเวลา ไม่เกิน 36 ชั่วโมง/คน/สัปดาห์"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    2. มีการทำงานล่วงเวลา ไม่เกิน 36 ชั่วโมง/คน/สัปดาห์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0402" id="rbt_58" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0402" id="rbt_59" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0402" id="rbt_60" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_20" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0403"
                                data-question="3. งานอันอาจเป็นอันตราย มีการทำงานวันละไม่เกิน 7 ชั่วโมง และสัปดาห์ละไม่เกิน 42 ชั่วโมง"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    3. งานอันอาจเป็นอันตราย มีการทำงานวันละไม่เกิน 7
                                    ชั่วโมง และสัปดาห์ละไม่เกิน 42 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0403" id="rbt_61" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0403" id="rbt_62" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0403" id="rbt_63" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_21" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0404"
                                data-question="4. ในกิจการปิโตรเลียมมีการทำงานวันละไม่เกิน 12 ชั่วโมง และสัปดาห์ละไม่เกิน 48 ชั่วโมง"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    4. ในกิจการปิโตรเลียมมีการทำงานวันละไม่เกิน 12
                                    ชั่วโมง และสัปดาห์ละไม่เกิน 48 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0404" id="rbt_64" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0404" id="rbt_65" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0404" id="rbt_66" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_22" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0405"
                                data-question="5. มีการกำหนดเวลาพักวันละไม่น้อยกว่า 1 ชั่วโมง หลังจากทำงานไม่เกิน 5 ชั่วโมงติดต่อกัน"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    5. มีการกำหนดเวลาพักวันละไม่น้อยกว่า 1 ชั่วโมง
                                    หลังจากทำงานไม่เกิน 5 ชั่วโมงติดต่อกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0405" id="rbt_67" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0405" id="rbt_68" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0405" id="rbt_69" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_23" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0406"
                                data-question="6. มีการกำหนดเวลาพัก ไม่น้อยกว่า 1 ชั่วโมง หลังจากลูกจ้างขับขี่ยานพาหนะได้ทำงานมาแล้วไม่เกิน 4 ชั่วโมง"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    6. มีการกำหนดเวลาพัก ไม่น้อยกว่า 1 ชั่วโมง
                                    หลังจากลูกจ้างขับขี่ยานพาหนะได้ทำงานมาแล้วไม่เกิน 4 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0406" id="rbt_70" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0406" id="rbt_71" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0406" id="rbt_72" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_24" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0407"
                                data-question="7. มีเวลาพักอย่างน้อย 20 นาที ก่อนทำงานล่วงเวลาไม่น้อยกว่า 2 ชั่วโมง"
                                data-section="4. ชั่วโมงการทำงาน และเวลาพัก (ข้อกำหนด 4.5)">
                                <div class="detail-quations-main">
                                    7. มีเวลาพักอย่างน้อย 20 นาที
                                    ก่อนทำงานล่วงเวลาไม่น้อยกว่า 2 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0407" id="rbt_73" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0407" id="rbt_74" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0407" id="rbt_75" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_25" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>5.วันหยุด วันลา
                                        (ข้อกำหนด 4.6)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0501"
                                data-question="1. มีวันหยุดประจำสัปดาห์ไม่น้อยกว่า 1 วัน"
                                data-section="5.วันหยุด วันลา (ข้อกำหนด 4.6)">
                                <div class="detail-quations-main">1. มีวันหยุดประจำสัปดาห์ไม่น้อยกว่า 1 วัน</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0501" id="rbt_76" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0501" id="rbt_77" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0501" id="rbt_78" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_26" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0502"
                                data-question="2. มีประกาศวันหยุดตามประเพณีปีหนึ่งไม่น้อยกว่า 13 วัน และจ่ายค่าจ้างให้กับลูกจ้างทุกคน"
                                data-section="5.วันหยุด วันลา (ข้อกำหนด 4.6)">
                                <div class="detail-quations-main">
                                    2. มีประกาศวันหยุดตามประเพณีปีหนึ่งไม่น้อยกว่า 13 วัน
                                    และจ่ายค่าจ้างให้กับลูกจ้างทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0502" id="rbt_79" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0502" id="rbt_80" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0502" id="rbt_81" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_27" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0503"
                                data-question="3. กำหนดให้ลูกจ้างที่ทำงานครบ 1 ปี มีสิทธิหยุดพักผ่อนประจำปี ได้ไม่น้อยกว่าปีละ 6 วันทำงาน โดยได้รับค่าจ้าง"
                                data-section="5.วันหยุด วันลา (ข้อกำหนด 4.6)">
                                <div class="detail-quations-main">
                                    3. กำหนดให้ลูกจ้างที่ทำงานครบ 1 ปี
                                    มีสิทธิหยุดพักผ่อนประจำปี ได้ไม่น้อยกว่าปีละ 6 วันทำงาน โดยได้รับค่าจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0503" id="rbt_82" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0503" id="rbt_83" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0503" id="rbt_84" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_28" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0601"
                                data-question="1. มีนโยบาย / ประกาศ หรือระเบียบปฏิบัติที่แสดงว่าไม่มีการเลือกปฏิบัติและลูกจ้างได้รับรู้ทั่วกัน"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย / ประกาศ
                                    หรือระเบียบปฏิบัติที่แสดงว่าไม่มีการเลือกปฏิบัติและลูกจ้างได้รับรู้ทั่วกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0601" id="rbt_85" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0601" id="rbt_86" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0601" id="rbt_87" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_29" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0602"
                                data-question="2. ประกาศรับสมัครงานไม่มีเกณฑ์เกี่ยวกับการเลือกปฏิบัติ เช่น ความแตกต่างในเรื่อง สัญชาติ เชื้อชาติ ศาสนา เพศ อายุ การติดเชื้อเอชไอวี หรือการเป็นสมาชิกสหภาพแรงงาน ฯลฯ"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    2.
                                    ประกาศรับสมัครงานไม่มีเกณฑ์เกี่ยวกับการเลือกปฏิบัติ เช่น ความแตกต่างในเรื่อง สัญชาติ
                                    เชื้อชาติ ศาสนา เพศ อายุ การติดเชื้อเอชไอวี หรือการเป็นสมาชิกสหภาพแรงงาน ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0602" id="rbt_88" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0602" id="rbt_89" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0602" id="rbt_90" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_30" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0603"
                                data-question="3. มีการกำหนดข้อมูลที่ให้กรอกในใบสมัครงานเฉพาะข้อมูลเกี่ยวกับการศึกษา ประสบการณ์ และความสามารถ"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    3.
                                    มีการกำหนดข้อมูลที่ให้กรอกในใบสมัครงานเฉพาะข้อมูลเกี่ยวกับการศึกษา ประสบการณ์
                                    และความสามารถ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0603" id="rbt_91" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0603" id="rbt_92" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0603" id="rbt_93" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_31" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0604"
                                data-question="4. มีการจ้างงานและจ่ายค่าตอบแทนลูกจ้างชายและหญิงเท่าเทียมกัน เช่น การกำหนดค่าจ้าง การเลื่อนตำแหน่ง การเกษียณอายุ ฯลฯ"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    4.
                                    มีการจ้างงานและจ่ายค่าตอบแทนลูกจ้างชายและหญิงเท่าเทียมกัน เช่น การกำหนดค่าจ้าง
                                    การเลื่อนตำแหน่ง การเกษียณอายุ ฯลฯ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0604" id="rbt_94" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0604" id="rbt_95" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0604" id="rbt_96" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_32" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0605"
                                data-question="5. มีการจัดสวัสดิการให้ลูกจ้างทุกคนเสมอภาคและเป็นธรรม โดยไม่นำเชื้อชาติ ศาสนา เพศ มาเป็นเกณฑ์การตัดสิน"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    5. มีการจัดสวัสดิการให้ลูกจ้างทุกคนเสมอภาคและเป็นธรรม
                                    โดยไม่นำเชื้อชาติ ศาสนา เพศ มาเป็นเกณฑ์การตัดสิน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0605" id="rbt_97" runat="server"></asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0605" id="rbt_98" runat="server"></asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0605" id="rbt_99" runat="server"></asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_33" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0606"
                                data-question="6. กรณีการเลิกจ้าง ต้องมีกระบวนการพิจารณาอย่างเป็นธรรม สอดคล้องตามระเบียบข้อบังคับเกี่ยวกับการทำงาน"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    6. กรณีการเลิกจ้าง
                                    ต้องมีกระบวนการพิจารณาอย่างเป็นธรรม สอดคล้องตามระเบียบข้อบังคับเกี่ยวกับการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0606" id="rbt_100" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0606" id="rbt_101" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0606" id="rbt_102" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_34" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0607"
                                data-question="7. มีระเบียบ/มีการปฏิบัติที่แสดงว่าไม่เลือกปฏิบัติต่อหญิงมีครรภ์ เช่น มีการรับลูกจ้างหญิงมีครรภ์เข้าทำงาน หรือเลิกจ้างลูกจ้างหญิงเพราะเหตุมีครรภ์"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    7.
                                    มีระเบียบ/มีการปฏิบัติที่แสดงว่าไม่เลือกปฏิบัติต่อหญิงมีครรภ์ เช่น
                                    มีการรับลูกจ้างหญิงมีครรภ์เข้าทำงาน หรือเลิกจ้างลูกจ้างหญิงเพราะเหตุมีครรภ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0607" id="rbt_103" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0607" id="rbt_104" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0607" id="rbt_105" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_35" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0608"
                                data-question="8. มีการกำหนดเกณฑ์การเกษียณอายุลูกจ้างชายและหญิงเท่าเทียมกัน"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    8.
                                    มีการกำหนดเกณฑ์การเกษียณอายุลูกจ้างชายและหญิงเท่าเทียมกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0608" id="rbt_106" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0608" id="rbt_107" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0608" id="rbt_108" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_36" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0609"
                                data-question="9. มีช่องทางการร้องเรียนกรณีลูกจ้างถูกเลือกปฏิบัติ"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    9. มีช่องทางการร้องเรียนกรณีลูกจ้างถูกเลือกปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0609" id="rbt_109" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0609" id="rbt_110" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0609" id="rbt_111" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_37" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0610"
                                data-question="10. มีการจ้างงานคนพิการ หรือส่งเงินเข้ากองทุนแทนการจ้างงาน หรือจัดพื้นที่ให้คนพิการจำหน่ายสินค้า"
                                data-section="6.การเลือกปฏิบัติ (ข้อกำหนด 4.7)">
                                <div class="detail-quations-main">
                                    10. มีการจ้างงานคนพิการ
                                    หรือส่งเงินเข้ากองทุนแทนการจ้างงาน หรือจัดพื้นที่ให้คนพิการจำหน่ายสินค้า
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0610" id="rbt_112" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0610" id="rbt_113" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0610" id="rbt_114" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_38" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>7.วินัยและการลงโทษ (ข้อกำหนด 4.8)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0701"
                                data-question="1. มีข้อบังคับเกี่ยวกับการทำงานในเรื่องวินัยและการลงโทษ และลูกจ้างได้รับรู้ทั่วกัน"
                                data-section="7.วินัยและการลงโทษ (ข้อกำหนด 4.8)">
                                <div class="detail-quations-main">
                                    1.
                                    มีข้อบังคับเกี่ยวกับการทำงานในเรื่องวินัยและการลงโทษ และลูกจ้างได้รับรู้ทั่วกัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0701" id="rbt_115" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0701" id="rbt_116" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0701" id="rbt_117" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_39" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0702"
                                data-question="2. มีข้อบังคับ/หรือการปฏิบัติที่แสดงว่าไม่มีการหักค่าจ้างหรือการลดค่าจ้างเพื่อการลงโทษทางวินัย"
                                data-section="7.วินัยและการลงโทษ (ข้อกำหนด 4.8)">
                                <div class="detail-quations-main">
                                    2.
                                    มีข้อบังคับ/หรือการปฏิบัติที่แสดงว่าไม่มีการหักค่าจ้างหรือการลดค่าจ้างเพื่อการลงโทษทางวินัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0702" id="rbt_118" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0702" id="rbt_119" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0702" id="rbt_120" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_40" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0703"
                                data-question="3. มีมาตรการมิให้ลูกจ้างถูกล่วงเกิน คุกคาม หรือก่อความเดือดร้อนรำคาญทางเพศ"
                                data-section="7.วินัยและการลงโทษ (ข้อกำหนด 4.8)">
                                <div class="detail-quations-main">
                                    3. มีมาตรการมิให้ลูกจ้างถูกล่วงเกิน คุกคาม
                                    หรือก่อความเดือดร้อนรำคาญทางเพศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0703" id="rbt_121" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0703" id="rbt_122" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0703" id="rbt_123" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_41" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>8.การล่วงเกินทางเพศและการ ใช้ความรุนแรง (ข้อกำหนด 4.9)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0801"
                                data-question="1. มีมาตรการป้องกัน และแก้ไขปัญหาลูกจ้างถูกคุกคาม ล่วงเกิน หรือได้รับความเดือดร้อน รำคาญทางเพศ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ"
                                data-section="8.การล่วงเกินทางเพศและการ ใช้ความรุนแรง (ข้อกำหนด 4.9)">
                                <div class="detail-quations-main">
                                    1. มีมาตรการป้องกัน และแก้ไขปัญหาลูกจ้างถูกคุกคาม
                                    ล่วงเกิน หรือได้รับความเดือดร้อน รำคาญทางเพศ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0801" id="rbt_124" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0801" id="rbt_125" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0801" id="rbt_126" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_42" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0802"
                                data-question="2. มีมาตรการป้องกัน และยุติการใช้ความรุนแรงในสถานประกอบกิจการ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ"
                                data-section="8.การล่วงเกินทางเพศและการ ใช้ความรุนแรง (ข้อกำหนด 4.9)">
                                <div class="detail-quations-main">
                                    2. มีมาตรการป้องกัน
                                    และยุติการใช้ความรุนแรงในสถานประกอบกิจการ ระบุในนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0802" id="rbt_127" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0802" id="rbt_128" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0802" id="rbt_129" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_43" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0901"
                                data-question="1. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ ไม่ว่าจ้าง หรือไม่สนับสนุนให้มีการจ้างแรงงานเด็กที่ผิดกฎหมาย ทุกรูปแบบ"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    1. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ ไม่ว่าจ้าง
                                    หรือไม่สนับสนุนให้มีการจ้างแรงงานเด็กที่ผิดกฎหมาย ทุกรูปแบบ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0901" id="rbt_130" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0901" id="rbt_131" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0901" id="rbt_132" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_44" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0902"
                                data-question="2. มีทะเบียนหรือแฟ้มประวัติลูกจ้างแสดงถึงอายุลูกจ้างทุกคนไม่ต่ำกว่า 15 ปี"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    2.
                                    มีทะเบียนหรือแฟ้มประวัติลูกจ้างแสดงถึงอายุลูกจ้างทุกคนไม่ต่ำกว่า 15 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0902" id="rbt_133" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0902" id="rbt_134" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0902" id="rbt_135" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_45" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0903"
                                data-question="3. มีมาตรการควบคุมลูกจ้างอายุต่ำกว่า 18 ปี ไม่ให้ทำงานอันตรายหรืออยู่ในภาวะแวดล้อมที่อาจก่อให้เกิดอันตรายหรือทำงาน ระหว่างเวลา 22.00 – 06.00 น. หรือทำงานล่วงเวลา หรือทำงานในงานบรรทุกหรือขนถ่ายสินค้าเรือเดินทะเล"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    3. มีมาตรการควบคุมลูกจ้างอายุต่ำกว่า 18 ปี
                                    ไม่ให้ทำงานอันตรายหรืออยู่ในภาวะแวดล้อมที่อาจก่อให้เกิดอันตรายหรือทำงาน ระหว่างเวลา
                                    22.00 – 06.00 น. หรือทำงานล่วงเวลา หรือทำงานในงานบรรทุกหรือขนถ่ายสินค้าเรือเดินทะเล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0903" id="rbt_136" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0903" id="rbt_137" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0903" id="rbt_138" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_46" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0904"
                                data-question="4. มีบันทึกสภาพการจ้างลูกจ้างเด็ก และมีการแจ้งการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    4. มีบันทึกสภาพการจ้างลูกจ้างเด็ก
                                    และมีการแจ้งการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0904" id="rbt_139" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0904" id="rbt_140" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0904" id="rbt_141" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_47" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0905"
                                data-question="5. มีการแจ้งสิ้นสุดการจ้างลูกจ้างเด็กอายุต่ำกว่า 18 ปี"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    5. มีการแจ้งสิ้นสุดการจ้างลูกจ้างเด็กอายุต่ำกว่า 18
                                    ปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0905" id="rbt_142" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0905" id="rbt_143" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0905" id="rbt_144" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_48" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0906"
                                data-question="6. ลูกจ้างเด็กมีเวลาพักระหว่างการทำงาน 4 ชั่วโมงแรก และได้พักไม่น้อยกว่า 1 ชั่วโมงหลังทำงานมาแล้วไม่เกิน 4 ชั่วโมง"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    6. ลูกจ้างเด็กมีเวลาพักระหว่างการทำงาน 4 ชั่วโมงแรก
                                    และได้พักไม่น้อยกว่า 1 ชั่วโมงหลังทำงานมาแล้วไม่เกิน 4 ชั่วโมง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0906" id="rbt_145" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0906" id="rbt_146" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0906" id="rbt_147" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_49" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0907"
                                data-question="7. มีระเบียบ ข้อบังคับ หรือการปฏิบัติที่แสดงว่าไม่มีการเรียกหลักประกันจากลูกจ้างเด็กและไม่จ่ายค่าจ้างของลูกจ้างเด็กให้แก่บุคคลอื่น และไม่มีการนำผลประโยชน์ใดที่จ่ายให้ล่วงหน้าก่อนการจ้างมาหักจากค่าจ้างของลูกจ้าง"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    7. มีระเบียบ ข้อบังคับ
                                    หรือการปฏิบัติที่แสดงว่าไม่มีการเรียกหลักประกันจากลูกจ้างเด็กและไม่จ่ายค่าจ้างของลูกจ้างเด็กให้แก่บุคคลอื่น
                                    และไม่มีการนำผลประโยชน์ใดที่จ่ายให้ล่วงหน้าก่อนการจ้างมาหักจากค่าจ้างของลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0907" id="rbt_148" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0907" id="rbt_149" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0907" id="rbt_150" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_50" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a0908"
                                data-question="8. ลูกจ้างเด็กมีสิทธิเพื่อการพัฒนา เช่น ประชุม สัมมนา ฝึกอบรม และมีการจ่ายค่าจ้างเพื่อการพัฒนาปีละไม่เกิน 30 วัน"
                                data-section="9.การใช้แรงงานเด็ก (ข้อกำหนด 4.10)">
                                <div class="detail-quations-main">
                                    8. ลูกจ้างเด็กมีสิทธิเพื่อการพัฒนา เช่น ประชุม สัมมนา
                                    ฝึกอบรม และมีการจ่ายค่าจ้างเพื่อการพัฒนาปีละไม่เกิน 30 วัน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a0908" id="rbt_151" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a0908" id="rbt_152" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a0908" id="rbt_153" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_51" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1001"
                                data-question="1. มีนโยบายสนับสนุน และส่งเสริมการเลี้ยงลูกด้วยนมแม่ในสถานประกอบกิจการ"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">
                                    1. มีนโยบายสนับสนุน
                                    และส่งเสริมการเลี้ยงลูกด้วยนมแม่ในสถานประกอบกิจการ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1001" id="rbt_154" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1001" id="rbt_155" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1001" id="rbt_156" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_52" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1002"
                                data-question="2. มีประกาศอนุญาตให้ลูกจ้างหญิงพักเพื่อเก็บน้ำนมในช่วงให้นมบุตร โดยให้นับเป็นเวลาทำงาน"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">
                                    2.
                                    มีประกาศอนุญาตให้ลูกจ้างหญิงพักเพื่อเก็บน้ำนมในช่วงให้นมบุตร โดยให้นับเป็นเวลาทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1002" id="rbt_157" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1002" id="rbt_158" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1002" id="rbt_159" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_53" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1003"
                                data-question="3. มีมาตรการควบคุมหรือระเบียบปฏิบัติไม่ให้ลูกจ้างหญิงตั้งครรภ์ ทำงานอย่างใดอย่างหนึ่งตามที่กฎหมายกำหนด และไม่มีการทำงานระหว่างเวลา 22.00-06.00 น. และไม่ให้ทำงานล่วงเวลายกเว้นงานที่กฎหมายกำหนด ซึ่งไม่มีผลกระทบต่อสุขภาพของลูกจ้าง และไม่มีการทำงานในวันหยุด"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">
                                    3.
                                    มีมาตรการควบคุมหรือระเบียบปฏิบัติไม่ให้ลูกจ้างหญิงตั้งครรภ์
                                    ทำงานอย่างใดอย่างหนึ่งตามที่กฎหมายกำหนด และไม่มีการทำงานระหว่างเวลา 22.00-06.00 น.
                                    และไม่ให้ทำงานล่วงเวลายกเว้นงานที่กฎหมายกำหนด ซึ่งไม่มีผลกระทบต่อสุขภาพของลูกจ้าง
                                    และไม่มีการทำงานในวันหยุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1003" id="rbt_160" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1003" id="rbt_161" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1003" id="rbt_162" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_54" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1004"
                                data-question="4. ลูกจ้างหญิงตั้งครรภ์มีสิทธิเปลี่ยนงาน"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">4. ลูกจ้างหญิงตั้งครรภ์มีสิทธิเปลี่ยนงาน</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1004" id="rbt_163" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1004" id="rbt_164" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1004" id="rbt_165" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_55" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1005"
                                data-question="5. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ การไม่เลิกจ้าง ลดตำแหน่ง หรือสิทธิประโยชน์เพราะเหตุ จากการมีครรภ์"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">
                                    5. มีนโยบาย/ระเบียบ/แนวปฏิบัติ/ประกาศ การไม่เลิกจ้าง
                                    ลดตำแหน่ง หรือสิทธิประโยชน์เพราะเหตุ จากการมีครรภ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1005" id="rbt_166" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1005" id="rbt_167" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1005" id="rbt_168" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_56" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1006"
                                data-question="6. ลูกจ้างหญิงมีสิทธิลาคลอดได้ 98 วัน โดยได้รับค่าจ้างไม่น้อยกว่า 45 วัน มีการจัดมุมนมแม่ โดยมีการจัดสถานที่และอุปกรณ์"
                                data-section="10.การใช้แรงงานหญิง (ข้อกำหนด 4.11)">
                                <div class="detail-quations-main">
                                    6. ลูกจ้างหญิงมีสิทธิลาคลอดได้ 98 วัน
                                    โดยได้รับค่าจ้างไม่น้อยกว่า 45 วัน มีการจัดมุมนมแม่ โดยมีการจัดสถานที่และอุปกรณ์
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1006" id="rbt_169" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1006" id="rbt_170" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1006" id="rbt_171" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_57" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1101"
                                data-question="1. มีการปฏิบัติที่แสดงว่าไม่มีการแทรกแซงขัดขวางการรวมตัวเพื่อจัดตั้งองค์กรของลูกจ้างหรือการเจรจาต่อรอง"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    1.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการแทรกแซงขัดขวางการรวมตัวเพื่อจัดตั้งองค์กรของลูกจ้างหรือการเจรจาต่อรอง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1101" id="rbt_172" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1101" id="rbt_173" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1101" id="rbt_174" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_58" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1102"
                                data-question="2. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างหรือกระทำการอันเป็นผลให้ลูกจ้างไม่สามารถทนทำงานต่อไปได้เพราะเหตุที่ลูกจ้างยื่นข้อเรียกร้องเจรจาหรือเข้าเป็นสมาชิกสหภาพแรงงาน"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    2.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างหรือกระทำการอันเป็นผลให้ลูกจ้างไม่สามารถทนทำงานต่อไปได้เพราะเหตุที่ลูกจ้างยื่นข้อเรียกร้องเจรจาหรือเข้าเป็นสมาชิกสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1102" id="rbt_175" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1102" id="rbt_176" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1102" id="rbt_177" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_59" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1103"
                                data-question="3. มีการปฏิบัติที่แสดงว่าไม่มีการขัดขวางแทรกแซงการดำเนินงานของสหภาพแรงงาน"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    3.
                                    มีการปฏิบัติที่แสดงว่าไม่มีการขัดขวางแทรกแซงการดำเนินงานของสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1103" id="rbt_178" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1103" id="rbt_179" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1103" id="rbt_180" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_60" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1104"
                                data-question="4. มีการเจรจาต่อรองหรือพูดคุยกันกับผู้แทนลูกจ้างหรือองค์กรลูกจ้าง"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    4.
                                    มีการเจรจาต่อรองหรือพูดคุยกันกับผู้แทนลูกจ้างหรือองค์กรลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1104" id="rbt_181" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1104" id="rbt_182" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1104" id="rbt_183" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_61" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1105"
                                data-question="5. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างลงโทษ หรือขัดขวางการปฏิบัติหน้าที่ของกรรมการลูกจ้างเว้นแต่ได้รับอนุญาตจากศาลแรงงาน"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    5. มีการปฏิบัติที่แสดงว่าไม่มีการเลิกจ้างลงโทษ
                                    หรือขัดขวางการปฏิบัติหน้าที่ของกรรมการลูกจ้างเว้นแต่ได้รับอนุญาตจากศาลแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1105" id="rbt_184" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1105" id="rbt_185" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1105" id="rbt_186" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_62" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1106"
                                data-question="6. มีการปฏิบัติที่เป็นธรรม ต่อผู้แทนลูกจ้างหรือลูกจ้างที่เป็นสมาชิกของสหภาพแรงงาน"
                                data-section="11.เสรีภาพในการสมาคมและการร่วมเจรจาต่อรอง (ข้อกำหนด 4.12)">
                                <div class="detail-quations-main">
                                    6. มีการปฏิบัติที่เป็นธรรม
                                    ต่อผู้แทนลูกจ้างหรือลูกจ้างที่เป็นสมาชิกของสหภาพแรงงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1106" id="rbt_187" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1106" id="rbt_188" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1106" id="rbt_189" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_63" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>12.ความปลอดภัย
                                        อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1201"
                                data-question="1. มีนโยบายด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    1. มีนโยบายด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1201" id="rbt_190" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1201" id="rbt_191" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1201" id="rbt_192" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_64" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1202"
                                data-question="2. มีโครงสร้างการบริหารด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main" style="height: 30px">
                                    2.
                                    มีโครงสร้างการบริหารด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่" style="height: 30px">
                                        <asp:radiobutton groupname="a1202" id="rbt_193" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่" style="height: 30px">
                                        <asp:radiobutton groupname="a1202" id="rbt_194" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง" style="height: 30px">
                                        <asp:radiobutton groupname="a1202" id="rbt_195" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:textbox data-note="true" id="txt_input_65" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1203"
                                data-question="3. มีแผนงานด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้มในการทำงาน และการนำไปปฏิบัติ"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    3. มีแผนงานด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้มในการทำงาน และการนำไปปฏิบัติ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1203" id="rbt_196" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1203" id="rbt_197" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1203" id="rbt_198" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_66" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1204"
                                data-question="4. มีการประเมินผลและทบทวนการจัดการด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    4. มีการประเมินผลและทบทวนการจัดการด้านความปลอดภัย
                                    อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1204" id="rbt_199" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1204" id="rbt_200" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1204" id="rbt_201" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_67" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1205"
                                data-question="5. มีการดำเนินการปรับปรุงด้านความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    5. มีการดำเนินการปรับปรุงด้านความปลอดภัย อาชีวอนามัย
                                    และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1205" id="rbt_202" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1205" id="rbt_203" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1205" id="rbt_204" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_68" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1206"
                                data-question="6. มีประกาศให้ลูกจ้างทราบ เรื่อง สิทธิ ขั้นตอนการปฏิเสธการทำงานที่ไม่มีมาตรการด้านความปลอดภัย"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    6. มีประกาศให้ลูกจ้างทราบ เรื่อง สิทธิ
                                    ขั้นตอนการปฏิเสธการทำงานที่ไม่มีมาตรการด้านความปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1206" id="rbt_205" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1206" id="rbt_206" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1206" id="rbt_207" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_69" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1207"
                                data-question="7. มีการติดข้อความแสดงสิทธิและหน้าที่ของนายจ้างและลูกจ้างเกี่ยวกับความปลอดภัยในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    7.
                                    มีการติดข้อความแสดงสิทธิและหน้าที่ของนายจ้างและลูกจ้างเกี่ยวกับความปลอดภัยในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1207" id="rbt_208" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1207" id="rbt_209" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1207" id="rbt_210" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_70" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1208"
                                data-question="8. มีข้อบังคับ และคู่มือว่าด้วยความปลอดภัยในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    8. มีข้อบังคับ และคู่มือว่าด้วยความปลอดภัยในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1208" id="rbt_211" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1208" id="rbt_212" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1208" id="rbt_213" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_71" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1209"
                                data-question="9. มีการติดประกาศสัญลักษณ์เตือนอันตรายและเครื่องหมายเกี่ยวกับความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน รวมทั้งข้อความแสดงสิทธิของนายจ้างและลูกจ้าง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    9.
                                    มีการติดประกาศสัญลักษณ์เตือนอันตรายและเครื่องหมายเกี่ยวกับความปลอดภัย
                                    อาชีวอนามัยและสภาพแวดล้อมในการทำงาน รวมทั้งข้อความแสดงสิทธิของนายจ้างและลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1209" id="rbt_214" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1209" id="rbt_215" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1209" id="rbt_216" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_72" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1210"
                                data-question="10. มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการความปลอดภัยอาชีวอนามัย และสภาพแวดล้อมในการทำงาน (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    10.
                                    มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการความปลอดภัยอาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                    (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1210" id="rbt_217" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1210" id="rbt_218" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1210" id="rbt_219" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_73" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1211"
                                data-question="11. คณะกรรมการความปลอดภัยฯ ได้รับการอบรมเกี่ยวกับบทบาทหน้าที่ตามกฎหมายครบทุกคน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    11. คณะกรรมการความปลอดภัยฯ
                                    ได้รับการอบรมเกี่ยวกับบทบาทหน้าที่ตามกฎหมายครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1211" id="rbt_220" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1211" id="rbt_221" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1211" id="rbt_222" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_74" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1212"
                                data-question="12. คณะกรรมการความปลอดภัยฯมีการประชุม อย่างน้อยเดือนละ 1 ครั้ง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    12. คณะกรรมการความปลอดภัยฯมีการประชุม
                                    อย่างน้อยเดือนละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1212" id="rbt_223" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1212" id="rbt_224" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1212" id="rbt_225" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_75" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1213"
                                data-question="13. หัวหน้างานได้รับการฝึกอบรมและแต่งตั้งเป็น จป.หัวหน้างานครบทุกคน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    13. หัวหน้างานได้รับการฝึกอบรมและแต่งตั้งเป็น
                                    จป.หัวหน้างานครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1213" id="rbt_226" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1213" id="rbt_227" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1213" id="rbt_228" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_76" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1214"
                                data-question="14. ผู้บริหารได้รับการฝึกอบรมและแต่งตั้ง เป็น จป.บริหารครบทุกคน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    14. ผู้บริหารได้รับการฝึกอบรมและแต่งตั้ง เป็น
                                    จป.บริหารครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1214" id="rbt_229" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1214" id="rbt_230" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1214" id="rbt_231" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_77" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1215"
                                data-question="15. มี จป.ระดับเทคนิค/เทคนิคชั้นสูง/วิชาชีพ ตามที่กฎหมายกำหนด"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    15. มี จป.ระดับเทคนิค/เทคนิคชั้นสูง/วิชาชีพ
                                    ตามที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1215" id="rbt_232" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1215" id="rbt_233" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1215" id="rbt_234" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_78" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1216"
                                data-question="16. มีการจัดตั้งหน่วยงานความปลอดภัยอาชีวอนามัยและสภาพแวดล้อมในการทำงานของสถานประกอบกิจการ (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    16.
                                    มีการจัดตั้งหน่วยงานความปลอดภัยอาชีวอนามัยและสภาพแวดล้อมในการทำงานของสถานประกอบกิจการ
                                    (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1216" id="rbt_235" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1216" id="rbt_236" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1216" id="rbt_237" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_79" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1217"
                                data-question="17. หน่วยงานความปลอดภัยขึ้นตรงต่อผู้บริหารสูงสุด"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    17. หน่วยงานความปลอดภัยขึ้นตรงต่อผู้บริหารสูงสุด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1217" id="rbt_238" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1217" id="rbt_239" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1217" id="rbt_240" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_80" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1218"
                                data-question="18. ลูกจ้างทุกคนได้รับการฝึกอบรมความปลอดภัย อาชีวอนามัย และสภาพแวดล้อมในการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    18. ลูกจ้างทุกคนได้รับการฝึกอบรมความปลอดภัย
                                    อาชีวอนามัย และสภาพแวดล้อมในการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1218" id="rbt_241" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1218" id="rbt_242" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1218" id="rbt_243" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_81" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1219"
                                data-question="19. มีการติดตั้งเครื่องป้องกันอันตรายจากเครื่องจักรอย่างครบถ้วน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    19.
                                    มีการติดตั้งเครื่องป้องกันอันตรายจากเครื่องจักรอย่างครบถ้วน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1219" id="rbt_244" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1219" id="rbt_245" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1219" id="rbt_246" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_82" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1220"
                                data-question="20. มีการตรวจสอบสายไฟฟ้าและอุปกรณ์ไฟฟ้าประจำปีโดยวิศวกร"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    20.
                                    มีการตรวจสอบสายไฟฟ้าและอุปกรณ์ไฟฟ้าประจำปีโดยวิศวกร
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1220" id="rbt_247" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1220" id="rbt_248" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1220" id="rbt_249" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_83" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1221"
                                data-question="21. มีการซ่อมแซมตรวจสอบหรือติดตั้งอุปกรณ์ไฟฟ้าพร้อมสายดินอย่างครบถ้วน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    21.
                                    มีการซ่อมแซมตรวจสอบหรือติดตั้งอุปกรณ์ไฟฟ้าพร้อมสายดินอย่างครบถ้วน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1221" id="rbt_250" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1221" id="rbt_251" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1221" id="rbt_252" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_84" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1222"
                                data-question="22. มีการทดสอบส่วนประกอบและอุปกรณ์ปั้นจั่นทุกเครื่องตามที่กฎหมายกำหนด"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    22.
                                    มีการทดสอบส่วนประกอบและอุปกรณ์ปั้นจั่นทุกเครื่องตามที่กฎหมายกำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1222" id="rbt_253" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1222" id="rbt_254" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1222" id="rbt_255" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_85" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1223"
                                data-question="23. มีการทดสอบหม้อน้ำประจำปีโดยวิศวกร และผู้ควบคุมหม้อน้ำผ่านการอบรมครบทุกคน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    23. มีการทดสอบหม้อน้ำประจำปีโดยวิศวกร
                                    และผู้ควบคุมหม้อน้ำผ่านการอบรมครบทุกคน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1223" id="rbt_256" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1223" id="rbt_257" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1223" id="rbt_258" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_86" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1224"
                                data-question="24. มีตรวจสอบสภาพลิฟต์ขนส่งประจำปีโดยวิศวกร"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">24. มีตรวจสอบสภาพลิฟต์ขนส่งประจำปีโดยวิศวกร</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1224" id="rbt_259" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1224" id="rbt_260" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1224" id="rbt_261" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_87" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1225" data-question="25. มีแผนป้องกัน และระงับอัคคีภัย"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">25. มีแผนป้องกัน และระงับอัคคีภัย</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1225" id="rbt_262" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1225" id="rbt_263" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1225" id="rbt_264" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_88" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1226"
                                data-question="26. มีลูกจ้างผ่านการอบรมหลักสูตรการดับเพลิงขั้นต้นไม่น้อยกว่าร้อยละ 40 ของจำนวนลูกจ้างในแต่ละหน่วยงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    26.
                                    มีลูกจ้างผ่านการอบรมหลักสูตรการดับเพลิงขั้นต้นไม่น้อยกว่าร้อยละ 40
                                    ของจำนวนลูกจ้างในแต่ละหน่วยงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1226" id="rbt_265" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1226" id="rbt_266" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1226" id="rbt_267" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_89" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1227"
                                data-question="27. ลูกจ้างทุกคนได้รับการฝึกซ้อมดับเพลิงและอพยพหนีไฟเป็นประจำทุกปี"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    27.
                                    ลูกจ้างทุกคนได้รับการฝึกซ้อมดับเพลิงและอพยพหนีไฟเป็นประจำทุกปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1227" id="rbt_268" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1227" id="rbt_269" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1227" id="rbt_270" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_90" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1228"
                                data-question="28. มีแผนการตรวจสอบอุปกรณ์ดับเพลิง และมีการตรวจสอบตามแผนที่กำหนด"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    28. มีแผนการตรวจสอบอุปกรณ์ดับเพลิง
                                    และมีการตรวจสอบตามแผนที่กำหนด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1228" id="rbt_271" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1228" id="rbt_272" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1228" id="rbt_273" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_91" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1229"
                                data-question="29. มีระบบน้ำดับเพลิงและอุปกรณ์และอุปกรณ์ประกอบเพื่อใช้ในการดับเพลิง ได้แก่ ปั๊มน้ำ ข้อต่อสายส่งน้ำดับเพลิง และสายส่งน้ำดับเพลิง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    29.
                                    มีระบบน้ำดับเพลิงและอุปกรณ์และอุปกรณ์ประกอบเพื่อใช้ในการดับเพลิง ได้แก่ ปั๊มน้ำ
                                    ข้อต่อสายส่งน้ำดับเพลิง และสายส่งน้ำดับเพลิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1229" id="rbt_274" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1229" id="rbt_275" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1229" id="rbt_276" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_92" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1230"
                                data-question="30. มีการตรวจวัดและวิเคราะห์สภาวะการทำงานเกี่ยวกับระดับความร้อนแสงสว่าง และเสียง เป็นประจำทุกปี"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    30.
                                    มีการตรวจวัดและวิเคราะห์สภาวะการทำงานเกี่ยวกับระดับความร้อนแสงสว่าง และเสียง
                                    เป็นประจำทุกปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1230" id="rbt_277" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1230" id="rbt_278" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1230" id="rbt_279" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_93" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1231"
                                data-question="31. มีการตรวจสอบอุปกรณ์แสดงอุณหภูมิในห้องเย็น และมีการกำหนดระยะเวลาการทำงานของลูกจ้างในห้องเย็นอย่างปลอดภัย"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    31. มีการตรวจสอบอุปกรณ์แสดงอุณหภูมิในห้องเย็น
                                    และมีการกำหนดระยะเวลาการทำงานของลูกจ้างในห้องเย็นอย่างปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1231" id="rbt_280" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1231" id="rbt_281" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1231" id="rbt_282" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_94" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1232"
                                data-question="32. มีสัญญาณแจ้งเหตุฉุกเฉิน ประตูมีระบบเปิดจากด้านใน และมีการจัดชุดปฏิบัติที่เหมาะ"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    32. มีสัญญาณแจ้งเหตุฉุกเฉิน ประตูมีระบบเปิดจากด้านใน
                                    และมีการจัดชุดปฏิบัติที่เหมาะ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1232" id="rbt_283" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1232" id="rbt_284" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1232" id="rbt_285" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_95" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1233"
                                data-question="33. มีการจัดและดูแลให้ลูกจ้างสวมใส่อุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคลตามสภาพและลักษณะของงานตลอดระยะเวลาทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    33.
                                    มีการจัดและดูแลให้ลูกจ้างสวมใส่อุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคลตามสภาพและลักษณะของงานตลอดระยะเวลาทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1233" id="rbt_286" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1233" id="rbt_287" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1233" id="rbt_288" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_96" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1234"
                                data-question="34. มีการตรวจวัดภาวะแวดล้อมสารเคมีในอากาศ (ปริมาณฝุ่น/สารเคมีที่ฟุ้งกระจาย)"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    34. มีการตรวจวัดภาวะแวดล้อมสารเคมีในอากาศ
                                    (ปริมาณฝุ่น/สารเคมีที่ฟุ้งกระจาย)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1234" id="rbt_289" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1234" id="rbt_290" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1234" id="rbt_291" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_97" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1235"
                                data-question="35. มีการแจ้งบัญชีรายชื่อสารเคมีอันตราย และรายละเอียดข้อความปลอดภัยของสารเคมีอันตรายที่มีอยู่ในครอบครอง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    35. มีการแจ้งบัญชีรายชื่อสารเคมีอันตราย
                                    และรายละเอียดข้อความปลอดภัยของสารเคมีอันตรายที่มีอยู่ในครอบครอง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1235" id="rbt_292" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1235" id="rbt_293" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1235" id="rbt_294" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_98" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1236"
                                data-question="36. มีการแจ้งลูกจ้างที่ทำงานเกี่ยวกับการสารเคมีอันตรายทราบและเข้าใจวิธีการทำงานที่ถูกต้องและปลอดภัย"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    36.
                                    มีการแจ้งลูกจ้างที่ทำงานเกี่ยวกับการสารเคมีอันตรายทราบและเข้าใจวิธีการทำงานที่ถูกต้องและปลอดภัย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1236" id="rbt_295" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1236" id="rbt_296" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1236" id="rbt_297" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_99" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1237"
                                data-question="37. มีการจัดทำคู่มือเกี่ยวกับการปฏิบัติ และขั้นตอนการทำงานเกี่ยวกับสารเคมีอันตราย"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    37. มีการจัดทำคู่มือเกี่ยวกับการปฏิบัติ
                                    และขั้นตอนการทำงานเกี่ยวกับสารเคมีอันตราย
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1237" id="rbt_298" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1237" id="rbt_299" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1237" id="rbt_300" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_100" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1238"
                                data-question="38. มีการปิดประกาศหรือจัดทำป้ายแจ้งข้อความ “ห้ามสูบบุหรี่ หรือรับประทานอาหาร หรือเครื่องดื่ม ประกอบอาหาร หรือเก็บอาหาร”"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    38. มีการปิดประกาศหรือจัดทำป้ายแจ้งข้อความ
                                    “ห้ามสูบบุหรี่ หรือรับประทานอาหาร หรือเครื่องดื่ม ประกอบอาหาร หรือเก็บอาหาร”
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1238" id="rbt_301" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1238" id="rbt_302" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1238" id="rbt_303" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_101" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1239"
                                data-question="39. มีป้ายแจ้งข้อความ “ที่อับอากาศ อันตราย ห้ามเข้า” ติดตั้งไว้โดยเปิดเผยบริเวณที่เข้าออกทางอับอากาศทุกแห่ง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    39. มีป้ายแจ้งข้อความ “ที่อับอากาศ อันตราย ห้ามเข้า”
                                    ติดตั้งไว้โดยเปิดเผยบริเวณที่เข้าออกทางอับอากาศทุกแห่ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1239" id="rbt_304" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1239" id="rbt_305" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1239" id="rbt_306" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_102" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1240"
                                data-question="40. มีการฝึกอบรมความปลอดภัยฯ ในที่อับอากาศ ให้กับผู้มีหน้าที่รับผิดชอบในการอนุญาต ผู้ควบคุมงาน ผู้ช่วยเหลือ และผู้ปฏิบัติงาน ในที่อับอากาศ"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    40. มีการฝึกอบรมความปลอดภัยฯ ในที่อับอากาศ
                                    ให้กับผู้มีหน้าที่รับผิดชอบในการอนุญาต ผู้ควบคุมงาน ผู้ช่วยเหลือ และผู้ปฏิบัติงาน
                                    ในที่อับอากาศ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1240" id="rbt_310" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1240" id="rbt_311" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1240" id="rbt_312" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_104" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1241"
                                data-question="41. มีหนังสืออนุญาตให้ลูกจ้างทำงานในที่อับอากาศ"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">41. มีหนังสืออนุญาตให้ลูกจ้างทำงานในที่อับอากาศ</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1241" id="rbt_313" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1241" id="rbt_314" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1241" id="rbt_315" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_105" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1242"
                                data-question="42. มีการกำหนดพื้นที่ควบคุมโดยจัดทำรั้ว คอกกั้นหรือเส้นแสดงแนวเขตและจัดให้มีป้ายข้อความ“ระวังอันตรายจากรังสี ห้ามเข้า”"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    42. มีการกำหนดพื้นที่ควบคุมโดยจัดทำรั้ว
                                    คอกกั้นหรือเส้นแสดงแนวเขตและจัดให้มีป้ายข้อความ“ระวังอันตรายจากรังสี ห้ามเข้า”
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1242" id="rbt_316" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1242" id="rbt_317" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1242" id="rbt_318" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_106" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1243"
                                data-question="43. มีผู้รับผิดชอบดำเนินการทางด้านเทคนิคในเรื่องรังสีตลอดระยะเวลาที่มีการทำงานเกี่ยวกับรังสีอย่างน้อย 1 คน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    43.
                                    มีผู้รับผิดชอบดำเนินการทางด้านเทคนิคในเรื่องรังสีตลอดระยะเวลาที่มีการทำงานเกี่ยวกับรังสีอย่างน้อย
                                    1 คน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1243" id="rbt_319" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1243" id="rbt_320" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1243" id="rbt_321" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_107" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1244"
                                data-question="44. มีแผนป้องกันและระงับอันตรายจากรังสี และมีการฝึกซ้อมตามแผน อย่างน้อยปีละ 1 ครั้ง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    44. มีแผนป้องกันและระงับอันตรายจากรังสี
                                    และมีการฝึกซ้อมตามแผน อย่างน้อยปีละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1244" id="rbt_322" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1244" id="rbt_323" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1244" id="rbt_324" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_108" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1245"
                                data-question="45. มีการตรวจสุขภาพลูกจ้างใหม่ที่ทำงานเกี่ยวกับปัจจัยเสี่ยง ภายใน 30 วัน และตรวจครั้งต่อไปอย่างน้อยปีละ 1 ครั้ง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main" style="height: 30px">
                                    45.
                                    มีการตรวจสุขภาพลูกจ้างใหม่ที่ทำงานเกี่ยวกับปัจจัยเสี่ยง ภายใน 30 วัน
                                    และตรวจครั้งต่อไปอย่างน้อยปีละ 1 ครั้ง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่" style="height: 30px">
                                        <asp:radiobutton groupname="a1245" id="rbt_325" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่" style="height: 30px">
                                        <asp:radiobutton groupname="a1245" id="rbt_326" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง" style="height: 30px">
                                        <asp:radiobutton groupname="a1245" id="rbt_327" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations" style="height: 30px">
                                        <asp:textbox data-note="true" id="txt_input_109" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1246"
                                data-question="46. จัดให้มีสมุดสุขภาพประจำตัวของลูกจ้างที่ทำงานเกี่ยวกับปัจจัยเสี่ยง"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    46.
                                    จัดให้มีสมุดสุขภาพประจำตัวของลูกจ้างที่ทำงานเกี่ยวกับปัจจัยเสี่ยง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1246" id="rbt_328" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1246" id="rbt_329" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1246" id="rbt_330" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_110" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1247"
                                data-question="47. ได้ส่งรายงาน จผส.๑ในกรณีผลการตรวจสุขภาพของลูกจ้างพบความผิดปกติหรือพบว่ามีลูกจ้างเจ็บป่วยเนื่องจากการทำงาน"
                                data-section="12.ความปลอดภัย อาชีวอนามัยและสภาพแวดล้อมในการทำงาน (ข้อกำหนด 4.13)">
                                <div class="detail-quations-main">
                                    47. ได้ส่งรายงาน
                                    จผส.๑ในกรณีผลการตรวจสุขภาพของลูกจ้างพบความผิดปกติหรือพบว่ามีลูกจ้างเจ็บป่วยเนื่องจากการทำงาน
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1247" id="rbt_331" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1247" id="rbt_332" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1247" id="rbt_333" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_111" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main">
                                <div bgcolor="#F4F4F4" class="detail-quations-main" colspan="5">
                                    <strong>13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)</strong>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1301"
                                data-question="1. มีห้องอาบน้ำถูกต้องตามสุขลักษณะ และมีจำนวนเพียงพอสำหรับลูกจ้าง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    1. มีห้องอาบน้ำถูกต้องตามสุขลักษณะ
                                    และมีจำนวนเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1301" id="rbt_307" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1301" id="rbt_308" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1301" id="rbt_309" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_103" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1302"
                                data-question="2. มีการแยกห้องอาบน้ำระหว่างลูกจ้างชายและหญิง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">2. มีการแยกห้องอาบน้ำระหว่างลูกจ้างชายและหญิง</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1302" id="rbt_334" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1302" id="rbt_335" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1302" id="rbt_336" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_112" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1303"
                                data-question="3. มีห้องส้วมถูกต้องตามสุขลักษณะ และมีจำนวนเพียงพอสำหรับลูกจ้าง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    3. มีห้องส้วมถูกต้องตามสุขลักษณะ
                                    และมีจำนวนเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1303" id="rbt_337" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1303" id="rbt_338" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1303" id="rbt_339" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_113" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1304"
                                data-question="4. มีการแยกห้องส้วมระหว่างลูกจ้างชายและลูกจ้างหญิง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    4. มีการแยกห้องส้วมระหว่างลูกจ้างชายและลูกจ้างหญิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1304" id="rbt_340" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1304" id="rbt_341" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1304" id="rbt_342" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_114" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1305"
                                data-question="5. มีกระดาษชำระหรือน้ำสำหรับชำระล้าง และมีกำหนดผู้รับผิดชอบการทำความสะอาด"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    5. มีกระดาษชำระหรือน้ำสำหรับชำระล้าง
                                    และมีกำหนดผู้รับผิดชอบการทำความสะอาด
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1305" id="rbt_343" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1305" id="rbt_344" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1305" id="rbt_345" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_115" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1306"
                                data-question="6. มีผลการตรวจคุณภาพน้ำดื่มและมีปริมาณเพียงพอสำหรับลูกจ้าง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    6.
                                    มีผลการตรวจคุณภาพน้ำดื่มและมีปริมาณเพียงพอสำหรับลูกจ้าง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1306" id="rbt_346" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1306" id="rbt_347" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1306" id="rbt_348" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_116" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1307"
                                data-question="7. มีปัจจัยการปฐมพยาบาลตามที่กฎหมายกำหนด และมีทะเบียนควบคุมรายการปัจจัยการปฐมพยาบาล"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    7. มีปัจจัยการปฐมพยาบาลตามที่กฎหมายกำหนด
                                    และมีทะเบียนควบคุมรายการปัจจัยการปฐมพยาบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1307" id="rbt_349" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1307" id="rbt_350" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1307" id="rbt_351" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_117" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1308"
                                data-question="8. มีสถานที่รับประทานอาหารสะอาดและถูกหลักสุขาภิบาล"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    8. มีสถานที่รับประทานอาหารสะอาดและถูกหลักสุขาภิบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1308" id="rbt_352" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1308" id="rbt_353" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1308" id="rbt_354" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_118" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1309"
                                data-question="9. มีสถานที่เก็บอาหารที่สะอาดและถูกหลักสุขาภิบาล"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    9. มีสถานที่เก็บอาหารที่สะอาดและถูกหลักสุขาภิบาล
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1309" id="rbt_355" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1309" id="rbt_356" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1309" id="rbt_357" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_119" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1310"
                                data-question="10. มีมาตรการควบคุมสุขอนามัยของผู้ปรุงอาหาร เช่น การจัดให้มีการตรวจสุขภาพประจำปี"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    10. มีมาตรการควบคุมสุขอนามัยของผู้ปรุงอาหาร เช่น
                                    การจัดให้มีการตรวจสุขภาพประจำปี
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1310" id="rbt_358" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1310" id="rbt_359" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1310" id="rbt_360" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_120" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1311"
                                data-question="11. มีห้องรักษาพยาบาลพร้อมเตียงพักคนไข้ เวชภัณฑ์และยาเพียงพอแก่การรักษาพยาบาลเบื้องต้น (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    11. มีห้องรักษาพยาบาลพร้อมเตียงพักคนไข้
                                    เวชภัณฑ์และยาเพียงพอแก่การรักษาพยาบาลเบื้องต้น (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1311" id="rbt_361" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1311" id="rbt_362" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1311" id="rbt_363" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_121" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1312"
                                data-question="12. มีพยาบาลตั้งแต่ระดับพยาบาลเทคนิคขึ้นไปประจำตลอดเวลาทำงาน (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    12.
                                    มีพยาบาลตั้งแต่ระดับพยาบาลเทคนิคขึ้นไปประจำตลอดเวลาทำงาน (กรณีมีลูกจ้างตั้งแต่ 200
                                    คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1312" id="rbt_364" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1312" id="rbt_365" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1312" id="rbt_366" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_122" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1313"
                                data-question="13. มีแพทย์แผนปัจจุบันชั้นหนึ่ง หรือมีสัญญากับโรงพยาบาลแทนการจัดให้มีแพทย์ (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    13. มีแพทย์แผนปัจจุบันชั้นหนึ่ง
                                    หรือมีสัญญากับโรงพยาบาลแทนการจัดให้มีแพทย์ (กรณีมีลูกจ้างตั้งแต่ 200 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1313" id="rbt_367" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1313" id="rbt_368" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1313" id="rbt_369" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_123" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-question="14. กรณีมีการจัดที่พักอาศัยให้กับลูกจ้าง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">14. กรณีมีการจัดที่พักอาศัยให้กับลูกจ้าง </div>
                                <div class="section-from">
                                    <div class="detail-quations" colspan="5"></div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a13141"
                                data-question="1) มีความเป็นสัดส่วนแยกระหว่างลูกจ้างชายและลูกจ้างหญิง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    1)
                                    มีความเป็นสัดส่วนแยกระหว่างลูกจ้างชายและลูกจ้างหญิง
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a13141" id="rbt_370" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a13141" id="rbt_371" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a13141" id="rbt_372" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_124" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a13142"
                                data-question="2) มีอุปกรณ์ เครื่องใช้เพื่อให้ลูกจ้างพักผ่อนนอนหลับได้สุขสบายตามสภาพ"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    2) มีอุปกรณ์
                                    เครื่องใช้เพื่อให้ลูกจ้างพักผ่อนนอนหลับได้สุขสบายตามสภาพ
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a13142" id="rbt_373" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a13142" id="rbt_374" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a13142" id="rbt_375" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_126" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a13143"
                                data-question="3) มีการทำความสะอาดที่พักอยู่เป็นประจำ"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">3) มีการทำความสะอาดที่พักอยู่เป็นประจำ</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a13143" id="rbt_376" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a13143" id="rbt_377" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a13143" id="rbt_378" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_127" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a13144"
                                data-question="4) มีการรักษาความปลอดภัยให้กับลูกจ้าง"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">4) มีการรักษาความปลอดภัยให้กับลูกจ้าง</div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a13144" id="rbt_379" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a13144" id="rbt_380" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a13144" id="rbt_381" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_128" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="row-main" data-group="a1315"
                                data-question="15. มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการสวัสดิการในสถานประกอบกิจการ จำนวนไม่น้อยกว่า 5 คน (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)"
                                data-section="13.สวัสดิการแรงงาน (ข้อกำหนด 4.14)">
                                <div class="detail-quations-main">
                                    15.
                                    มีประกาศ/คำสั่งแต่งตั้งคณะกรรมการสวัสดิการในสถานประกอบกิจการ จำนวนไม่น้อยกว่า 5 คน
                                    (กรณีมีลูกจ้างตั้งแต่ 50 คนขึ้นไป)
                                </div>
                                <div class="section-from">
                                    <div class="detail-quations" data-answer="ใช่">
                                        <asp:radiobutton groupname="a1315" id="rbt_382" runat="server">
                                        </asp:radiobutton>
                                        <div>ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่ใช่">
                                        <asp:radiobutton groupname="a1315" id="rbt_383" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่ใช่</div>
                                    </div>
                                    <div class="detail-quations" data-answer="ไม่เกี่ยวข้อง">
                                        <asp:radiobutton groupname="a1315" id="rbt_384" runat="server">
                                        </asp:radiobutton>
                                        <div>ไม่เกี่ยวข้อง</div>
                                    </div>
                                    <div class="detail-quations">
                                        <asp:textbox data-note="true" id="txt_input_125" runat="server"></asp:textbox>
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
                            <asp:textbox cssclass="form-control mb-1" id="txtRemark_2" rows="3" runat="server"
                                textmode="SingleLine"></asp:textbox>
                            <div class="text-danger">** ระบุ เป็น ชื่อ - นามสกุล</div>
                        </div>
                    </div>
                    <!-- หมายเหตุ -->
                    <div class="d-flex flex-column flex-wrap mb-3 align-items-start">
                        <label class="text-center fw-bold me-3" style="min-width: 170px;">หมายเหตุ</label>
                        <div class="flex-grow-1">
                            <asp:textbox cssclass="form-control" id="txtRemark_3" rows="3" runat="server"
                                textmode="SingleLine"></asp:textbox>
                        </div>
                    </div>
                </div>
                <!-- ปุ่ม -->
                <div class="d-flex justify-content-center gap-2 mt-4">
                    <asp:button cssclass="btn-cancle" id="btCancel" runat="server" text="CANCEL" visible="true">
                    </asp:button>
                    <asp:button cssclass="btn-submit" id="btSave" runat="server" text="SAVE" visible="true">
                    </asp:button>
                    <button type="button" onclick="clearLocalAnswers()">ล้างคำตอบที่บันทึกในเครื่อง</button>

                </div>
                
                <button type="button" onclick="saveAjax()">บันทึก (AJAX)</button>
            </div>
        </div>
    </div>


</asp:Content>
