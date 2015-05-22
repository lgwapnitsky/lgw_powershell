IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PopACAPolicies_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_PopACAPolicies_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PopACAPolicies_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






CREATE     proc dbo.INT_PopACAPolicies_BOR 
	@Policy          nvarchar (50),
	@STATUS          nvarchar (50),
	@LASTNAME        nvarchar (50),
	@ADDRESS         nvarchar (50),
	@CITY            nvarchar (50),
	@ST              nvarchar (50),
	@ZIP             nvarchar (50),
	@LICENSE         nvarchar (50),
	@CHILD           nvarchar (50),
	@EFFDATE         nvarchar (50),
	@EXPDATE         nvarchar (50),
	@LIABLIMIT       nvarchar (50),
	@OCCLIMIT        nvarchar (50),
	@AGGLIMIT        nvarchar (50),
	@FIRELIMIT       nvarchar (50),
	@ABUSEOCC        nvarchar (50),
	@ABUSEAGG        nvarchar (50),
	@MEMBER          nvarchar (50),
	@TERM            nvarchar (50),
	@PAY             nvarchar (50),
	@ANNAUTOPREM     nvarchar (50),
	@ANNLIABPREM     nvarchar (50),
	@TOTPMT          nvarchar (50),
	@LESSESTAX       nvarchar (50),
	@STATETAXES      nvarchar (50),
	@HAYSCOMMLIAB   nvarchar (50),
	@NONAME         nvarchar (50),
	@HAYSCOMMAUTO    nvarchar (50),
	@NETDUEPHLYLIAB  nvarchar (50),
	@GROSSDUEPHLYLIAB nvarchar (50),
	@NETDUEPHLYAUTO   nvarchar (50),
	@GROSSDUEPHLYAUTO nvarchar (50),
	@CANCELDATE      nvarchar (50),
	@AMENDDATE       nvarchar (50),
	@AMENDENTRY      nvarchar (50),
	@COMMENT         nvarchar (50),
	@Unexpired       nvarchar (50),
	@AutoAnnualPremium       nvarchar (50),
	@LiabilityAnnualPremium  nvarchar (50),
	@AmounttoberefundedGross nvarchar (50),
	@Taxrefund               nvarchar (50),
	@Commissionrefund        nvarchar (50),
	@AmounttoberefundedNet   nvarchar (50),
	@ST1                     nvarchar (50),
        @FirstName               nvarchar (50),
        @Address2                nvarchar (50),
        @NJFee                   nvarchar (50),
        @WVFee                   nvarchar (50),
        @KYMun                   nvarchar (50),
        @KYCollection            nvarchar (50),
        @KYIPS                   nvarchar (50),
        @CancelReason            nvarchar (50)
as

SET NOCOUNT ON


DECLARE @ACAID int

INSERT INTO ACA_Policies 
([Policy#],[STATUS],[LAST NAME],[ADDRESS],[CITY],[ST],[ZIP],[LICENSE],
 [CHILD],[EFF DATE],[EXP DATE],[LIAB LIMIT],[OCC LIMIT],[AGG LIMIT], 
 [FIRE LIMIT],[ABUSE OCC], [ABUSE AGG],[MEMBER#],[TERM],[PAY],[ANN AUTO PREM],
 [ANN LIAB PREM],[TOT PMT],[LESS E&S TAX],[STATE TAXES/SURCHARGES],
 [HAYS COMM 17.5% LIAB],[NONAME],[HAYS COMM 17.5% AUTO],
 [NET DUE PHLY LIAB],[GROSS DUE PHLY LIAB],[NET DUE PHLY AUTO],	
 [GROSS DUE PHLY AUTO], [CANCEL DATE],[AMEND DATE],[AMEND ENTRY], 
 [COMMENT],[Unexpired %],[Auto Annual Premium],	[Liability Annual Premium], 
 [Amount to be refunded, Gross],[Tax refund],[Commission refund],
 [Amount to be refunded, Net],[ST1],FirstName,Address2,NJFee,WVFee,KYMun,
 KYCollection,KYIPS,CancelReason
)
VALUES
(@Policy, @STATUS, @LASTNAME, @ADDRESS, @CITY, @ST, @ZIP, @LICENSE, 
 @CHILD, @EFFDATE, @EXPDATE, @LIABLIMIT, @OCCLIMIT, @AGGLIMIT,
 @FIRELIMIT, @ABUSEOCC, @ABUSEAGG, @MEMBER, @TERM, @PAY, @ANNAUTOPREM,
 @ANNLIABPREM, @TOTPMT, @LESSESTAX, @STATETAXES,
 @HAYSCOMMLIAB, @NONAME, @HAYSCOMMAUTO, 
 @NETDUEPHLYLIAB, @GROSSDUEPHLYLIAB, @NETDUEPHLYAUTO, 
 @GROSSDUEPHLYAUTO, @CANCELDATE, @AMENDDATE, @AMENDENTRY, 
 @COMMENT, @Unexpired, @AutoAnnualPremium, @LiabilityAnnualPremium,
 @AmounttoberefundedGross, @Taxrefund, @Commissionrefund, 
 @AmounttoberefundedNet, @ST1,@FirstName,@Address2,@NJFee,@WVFee,@KYMun,
 @KYCollection,@KYIPS,@CancelReason
)

SET @ACAID = @@IDENTITY

' 
END
GO
