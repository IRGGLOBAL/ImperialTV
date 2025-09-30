import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/style.dart';
import '../../../utils/text_strings.dart';

class HelpDetailsView extends StatelessWidget {
  final int index;
  HelpDetailsView({Key? key, required this.index}) : super(key: key);

  final List<String> titles = [
    MyStrings.changingtheimperialtvapplanguage,
    MyStrings.cancelmyimperialtvappsubscription,
    MyStrings.installimperialtvonyourdevices,
    MyStrings.maturityratings,
    MyStrings.parentalcontrolsonimperialtv,
    MyStrings.watchimperialtvonchromecast,
    MyStrings.howdoicastimperialtvtomytv,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.help.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () {
            Get.back();
          },
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 16,bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Title
                    AppText(
                      text:titles[index].tr,
                      // text:MyStrings.help.tr,
                      size: AppDimensions.FONT_SIZE_16,
                      fontWeight: FontWeight.w600,
                      color: MyColor.primaryColor,
                    ),


                    const SizedBox(height: 6),

                    _buildContent(index),
                  ],
                ),
              ),



              const SizedBox(height: 24),

              /// Contact Us Section
              AppText(
                  text: MyStrings.wereyouabletosolveyourissue.tr,
                  size: AppDimensions.FONT_SIZE_16,
                  fontWeight: FontWeight.w600,
                  color: MyColor.colorWhite,
                  textAlign: TextAlign.center
              ),

              const SizedBox(height: 12),

              AppButton(
                buttonName: "${MyStrings.yes.tr}",
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w500,
                buttonWidth: double.infinity,
                buttonHeight: 45,
                buttonRadius: BorderRadius.circular(30),
                //borderColor: Colors.grey.shade400,
                onTap: () {},
              ),

              const SizedBox(height: 12),

              AppButton(
                buttonName: "${MyStrings.ineedmorehelp.tr}",
                buttonColor: Colors.white,
                textColor: Colors.black,
                textSize: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w500,
                buttonWidth: double.infinity,
                buttonHeight: 45,
                buttonRadius: BorderRadius.circular(30),
                //borderColor: Colors.grey.shade400,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return _languageContent();
      case 1:
        return _cancelSubscriptionContent();
      case 2:
        return _installDeviceContent();
      case 3:
        return _chromecastContent();
      case 4:
        return _parentalContent();
      case 5:
        return _watchimperialtvContent();
      case 6:
        return _watchimperialtvContent();
      default:
        return Center(
          child: AppText(
            text: "Content not available yet",
            size: 14,
            color: MyColor.colorWhite,
          ),
        );
    }
  }

  Widget _languageContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Sub-heading (underlined)
        Text(
          MyStrings.ontheimperialtvmobileapp.tr,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),

        // Bullet points
        _buildBullet(MyStrings.opentheimperialtvapp.tr,),
        _buildBullet(MyStrings.gotohomescreenand.tr,),
        _buildBullet(MyStrings.selectlanguagethenselectyour.tr,),

        const SizedBox(height: 14),

        // Sub-heading (underlined)
        Text(
          MyStrings.onsmarttvsandallother.tr,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),

        _buildBullet(MyStrings.opentheimperialtvapp.tr,),
        _buildBullet(MyStrings.accesstheimperialtvappssettingoption.tr,),
        _buildBullet(MyStrings.underlanguageselectyourdesiredlanguage.tr,),

        const SizedBox(height: 14),

        // Extra note
        Text(
          MyStrings.inadditionimperialtvcustomers.tr,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),

      ],
    );
  }

  Widget _cancelSubscriptionContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.ifyoursubscriptionwascreatedthrough.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.gotoaccountandsettingsandthenselect.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.anyadditionalsubscriptionstiedto.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),


      ],
    );
  }

  Widget _installDeviceContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.usingtheimperialtvappyouwill.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.imperialtvisavailableonarangeoftelevisions.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.searchforimperialtvandthen.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.opentheimperialtvappregister.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),



      ],
    );
  }

  ///
  Widget _chromecastContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Sub-heading (underlined)
        AppText(
          text:  MyStrings.maturityratingscombinemovieandtv.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        /// UK

        AppText(
          text:  MyStrings.unitedtates.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        //const SizedBox(height: 5),

        // Bullet points
        _buildBullet(MyStrings.mppamotionpictureassociation.tr,),
        _buildBullet(MyStrings.tvparentalguidelinesfor.tr,),

        const SizedBox(height: 6),

        // Sub-heading (underlined)
        AppText(
        text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneralaudience.tr,),
        _buildBullet(MyStrings.pgparentalguidance.tr,),
        _buildBullet(MyStrings.pgparentsstronglycautioned.tr,),
        _buildBullet(MyStrings.rrestrictedrestrictedto.tr,),
        _buildBullet(MyStrings.ncnooneandunderadmitted.tr,),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.tvysuitableforallchildren.tr,),
        _buildBullet(MyStrings.tvysuitablefor.tr,),
        _buildBullet(MyStrings.tvggeneralaudience.tr,),
        _buildBullet(MyStrings.tvpdparentalguidancesuggested.tr,),
        _buildBullet(MyStrings.tvsuitableforandolder.tr,),
        _buildBullet(MyStrings.tvmamatureaudiencesonly.tr,),

        const SizedBox(height: 6),

        ///United Kingdon (uk)

        AppText(
          text:  MyStrings.unitedkingdomuk.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.bbfcbritishboardoffilm.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.uuniversalsuitablefor.tr,),
        _buildBullet(MyStrings.pgparentalguidancesuitable.tr,),
        _buildBullet(MyStrings.suitableforyearsandover.tr,),
        _buildBullet(MyStrings.suitableforyearsandovers.tr,),
        _buildBullet(MyStrings.suitableforadultsonly.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.cchildrensuitableforchildren.tr,),
        _buildBullet(MyStrings.uuniversalsuitableforall.tr,),
        _buildBullet(MyStrings.pgparentalguidancerecommende.tr,),
        _buildBullet(MyStrings.suitableforyearsandover12.tr,),
        _buildBullet(MyStrings.suitablefor15yearsandover.tr,),
        _buildBullet(MyStrings.suitableforadultsonly.tr,),

        ///Germany

        AppText(
          text:  MyStrings.germany.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        _buildBullet(MyStrings.fskfreiwilligeselbstkontrollederfilmwirtschaft.tr,),
        _buildBullet(MyStrings.fsk18strictcontentratingforadults.tr,),
        _buildBullet(MyStrings.uskunterhaltungssoftwareselbstkontrolle.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.fsk0suitableforallages.tr,),
        _buildBullet(MyStrings.fsk6suitableforchildrenaged6andolder.tr,),
        _buildBullet(MyStrings.fsk12suitableforchildrenaged12andolder.tr,),
        _buildBullet(MyStrings.fsk16suitableforteenagersaged16andolder.tr,),
        _buildBullet(MyStrings.fsk18restrictedtoadults.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.kkinderchildren.tr,),
        _buildBullet(MyStrings.ffreigegebenopensuitablefor.tr,),
        _buildBullet(MyStrings.sameasabovefor.tr,),


        ///Japan
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.japan.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.eirinthefilmclassificationand.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneralaudienceallages.tr,),
        _buildBullet(MyStrings.pg12parentalguidanceforchildrenunder12.tr,),
        _buildBullet(MyStrings.r15suitableforages15andup.tr,),
        _buildBullet(MyStrings.r18suitableforages18andup.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.allaudiences.tr,),
        _buildBullet(MyStrings.bchildrensuitableforchildren.tr,),
        _buildBullet(MyStrings.cteensandadultsrecommended.tr,),
        _buildBullet(MyStrings.drestricted18only.tr,),

        ///New Zealand

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.newzealand.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.filmandvidelabelingbody.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneralsuitableforallages.tr,),
        _buildBullet(MyStrings.pgparentalguidancesuitableforgeneral.tr,),
        _buildBullet(MyStrings.mmaturerecommendedformatureaudiences15.tr,),
        _buildBullet(MyStrings.restrictedcontent.tr,),
        _buildBullet(MyStrings.restrictedforadults.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneral.tr,),
        _buildBullet(MyStrings.pgparentalguidances.tr,),
        _buildBullet(MyStrings.mmaturecontentnotsuitable.tr,),
        _buildBullet(MyStrings.suitableforages16.tr,),
        _buildBullet(MyStrings.suitableforages18.tr,),

        /// France

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.france.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.cnccentrenationalducinema.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.usuitableforallages.tr,),
        _buildBullet(MyStrings.suitableforages10andup.tr,),
        _buildBullet(MyStrings.suitableforages12andup.tr,),
        _buildBullet(MyStrings.suitableforages16andup.tr,),
        _buildBullet(MyStrings.suitableforadultsonly.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.touspublicsallpublicsuitableforall.tr,),
        _buildBullet(MyStrings.notrecommendedforchildrenunder10.tr,),
        _buildBullet(MyStrings.notrecommendedforchildrenunder12.tr,),
        _buildBullet(MyStrings.notrecommendedforchildrenunder16.tr,),
        _buildBullet(MyStrings.notrecommendedforchildrenunder18.tr,),

        /// Italy

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.italy.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.filmratingsbytheitalianministryofculture.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ttuttisuitableforallages.tr,),
        _buildBullet(MyStrings.vmsuitableforages6andolder.tr,),
        _buildBullet(MyStrings.vmsuitableforages12andolder.tr,),
        _buildBullet(MyStrings.vm14suitableforages14andolder.tr,),
        _buildBullet(MyStrings.vm18suitableforadultsonly.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ttuttisuitableforallaudiences.tr,),
        _buildBullet(MyStrings.vvietatoaiminorirestrictedforunderageviewers.tr,),

        ///Spain

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.spain.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.iccainstitutodela.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.aptaparatodolospublicos.tr,),
        _buildBullet(MyStrings.suitableforviewersaged7andolder.tr,),
        _buildBullet(MyStrings.suitableforviewersaged12andolder.tr,),
        _buildBullet(MyStrings.suitableforviewersaged16andolder.tr,),
        _buildBullet(MyStrings.suitableforviewersaged18andolder.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.tptodoslospublicos.tr,),
        _buildBullet(MyStrings.suitablefor7yearsandolder.tr,),
        _buildBullet(MyStrings.suitablefor12yearsandolder.tr,),
        _buildBullet(MyStrings.suitablefor16yearsandolder.tr,),
        _buildBullet(MyStrings.suitablefor18yearsandolder.tr,),

        ///Canada

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.canada.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.canadianfilmclassification.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneralaudiencesuitableforall.tr,),
        _buildBullet(MyStrings.pgparentalguidancesomematerial.tr,),
        _buildBullet(MyStrings.asuitableforviewersaged14andolder.tr,),
        _buildBullet(MyStrings.asuitableforviewersaged18andolder.tr,),
        _buildBullet(MyStrings.rrestrictedsuitableforadultsonly.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.cchildrensuitableforchildren.tr,),
        _buildBullet(MyStrings.ggeneralsuitableforall.tr,),
        _buildBullet(MyStrings.pgparentalguidancerecommended.tr,),
        _buildBullet(MyStrings.asuitablefor14andolder.tr,),
        _buildBullet(MyStrings.asuitablefor18andolder.tr,),
        _buildBullet(MyStrings.rrestrictedtoadultaudiences.tr,),

        ///Mexico
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.mexico.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.institutomexicanode.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.aaptaparatodopublicosuitableforallaudiences.tr,),
        _buildBullet(MyStrings.aasuitableforchildrenunder12.tr,),
        _buildBullet(MyStrings.bsuitableforviewersaged12andolder.tr,),
        _buildBullet(MyStrings.b15suitableforviewersaged15andolder.tr,),
        _buildBullet(MyStrings.csuitableforviewersaged18andolder.tr,),

        ///Singapore

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.singapore.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.infocommmediadevelopmentauthorityimda.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.ggeneralaudiences.tr,),
        _buildBullet(MyStrings.pgparentalguidances.tr,),
        _buildBullet(MyStrings.pg13suitableforviewersaged13andolder.tr,),
        _buildBullet(MyStrings.nc16suitableforviewersaged16andolder.tr,),
        _buildBullet(MyStrings.m18suitableforviewersaged18andolder.tr,),
        _buildBullet(MyStrings.rrestrictedtoviewersaged21andolder.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.pgparentalguidances.tr,),
        _buildBullet(MyStrings.pgparentalguidancerecommende.tr,),
        _buildBullet(MyStrings.pg13suitableforages13andabove.tr,),
        _buildBullet(MyStrings.m18suitableforages18andabove.tr,),
        _buildBullet(MyStrings.r21suitableforages21andabove.tr,),


        ///australia

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.australia12.tr,
          size: AppDimensions.FONT_SIZE_14,
          fontWeight: FontWeight.w700,
          color: MyColor.primaryColor,
        ),
        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.australianclassificationboard.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.movieratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.gsuitableforallaudiences.tr,),
        _buildBullet(MyStrings.mmaturecontentsuitablefor15yearsandolder.tr,),
        _buildBullet(MyStrings.na15notsuitableforchildrenunder15.tr,),
        _buildBullet(MyStrings.r18restrictedtoadults18yearsandolder.tr,),


        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tvratings.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.cchildrensprogramming.tr,),
        _buildBullet(MyStrings.ggeneralaudiences.tr,),
        _buildBullet(MyStrings.pgparentalguidances.tr,),
        _buildBullet(MyStrings.mmaturecontentsuitablefor15.tr,),
        _buildBullet(MyStrings.ma15suitablefor15.tr,),
      ],
    );
  }

  Widget _parentalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.imperialtvparentalcontrolsallowyoutosetrestrictions.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 14),

        AppText(
          text:  MyStrings.imperialtvparentalcontrols.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

      ],
    );
  }

  Widget _watchimperialtvContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 6),

        AppText(
          text:  MyStrings.tousegooglechromecastwith.tr,
          size: AppDimensions.FONT_SIZE_12,
          fontWeight: FontWeight.w500,
          color: MyColor.primaryColor,
        ),

        const SizedBox(height: 6),

        _buildBullet(MyStrings.fromtheimperialtvappselectthecasticon.tr,),
        _buildBullet(MyStrings.selectthechromecastdevicethatyouwishtouse.tr,),
        _buildBullet(MyStrings.youiosorandroiddevicemust.tr,),
        _buildBullet(MyStrings.selectatitlethatyouwishtowatch.tr,),
        _buildBullet(MyStrings.ifyouwishtochangesubtitles.tr,),



      ],
    );
  }

  // Helper method
  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "• ",
            size: AppDimensions.FONT_SIZE_14,
            fontWeight: FontWeight.w500,
            color: MyColor.primaryColor,
          ),
          Expanded(
            child:  AppText(
              text: text,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w500,
              color: MyColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}



// class HelpDetailsViews extends StatelessWidget {
//
//   HelpDetailsViews({Key? key}) : super(key: key);
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               /// List of Help Options
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 16,bottom: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Main Title
//                     Text(
//                       MyStrings.changetheimperialtvapplanguage.tr,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//
//
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
