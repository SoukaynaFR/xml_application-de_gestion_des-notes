import javax.xml.transform.TransformerException;
import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException, TransformerException, SAXException, SaxonApiException {

        // ** Generate The Time Table
        TimeTable timeTable = new TimeTable();
        timeTable.generateTimeTable("emploiTemps");
        System.out.println("Generating Time Table...");

        // ** Generate carte etudiant Front & Back by apogee
        String Apogee = "20000755";
        StudentCard carteEtudiant = new StudentCard();
        carteEtudiant.generateStudentCardByApogee(Apogee, "frontCard", "backCard");

        System.out.println("Generating Carte Etudiant for APOGEE=" + Apogee);

        // ** Generate carte etudiant Front & Back by CNE
        String cne = "L209287";
        StudentCard carteEtudiant2 = new StudentCard();
        carteEtudiant2.generateStudentCardByCNE(cne,"frontCard2","backCard2");

        System.out.println("Generating Carte Etudiant for CNE=" + cne);


        // ** Generate Attestation by CNE
//        String cne = "L209287";
        AttestationReussite Attestation = new AttestationReussite();
        Attestation.generateAttestationByCNE(cne,"AttestationReussite");

        System.out.println("Generating Attestation de Reussite for CNE=" + cne);

        // ** Generate Attestation by Apogee
//        String Apogee = "20000755";
        AttestationReussite Attestation2 = new AttestationReussite();
        Attestation2.generateAttestationByApogee(Apogee,"AttestationReussite2");

        System.out.println("Generating Attestation de Reussite for APOGEE=" + Apogee);


        // ** Generate Affichage by MODULE
        String Module = "GINF31";
        AffichageNote Affichage = new AffichageNote();
        Affichage.generateAffichageNormaleByModule(Module,"AffichageNormale");
        Affichage.generateAffichageRattByModule(Module,"AffichageRatt");

        System.out.println("Generating Affichage Normale + Ratt for MODULE=" + Module);

        // ** Generate releveNoteDetails by Apogee
//        String Apogee = "20000755";
        ReleveNoteDetails releveNote = new ReleveNoteDetails();
        releveNote.enerateReleveNoteByApogee(Apogee,"releveNoteDetails");

        System.out.println("Generating Releve de Note Details for APOGEE=" + Apogee);

        // ** Generate releveNoteDetails by CNE
//        String cne = "L209287";
        ReleveNoteDetails releveNote2 = new ReleveNoteDetails();
        releveNote2.generateReleveNoteByCNE(cne,"releveNoteDetails2");

        System.out.println("Generating Releve de Note Details for CNE=" + cne);

        // ** Generate releve Note V-NV by Apogee
//        String Apogee = "20000755";
        ReleverNoteVNV releveNoteV_NV = new ReleverNoteVNV();
        releveNoteV_NV.generateReleveNoteVNVByApogee(Apogee,"releveNoteV_NV");

        System.out.println("Generating Releve de Note V-NV for APOGEE=" + Apogee);

        // ** Generate releveNoteDetails by CNE
//        String cne = "L209287";
        ReleverNoteVNV releveNoteV_NV2 = new ReleverNoteVNV();
        releveNoteV_NV2.generateReleveNoteVNVByCNE(cne,"releveNoteV_NV2");

        System.out.println("Generating Releve de Note Details for CNE=" + cne);
    }
}
