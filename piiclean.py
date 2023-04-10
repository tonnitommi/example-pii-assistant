from presidio_analyzer import AnalyzerEngine
from presidio_anonymizer import AnonymizerEngine
import spacy

DEFAULT_ANOYNM_ENTITIES = [
    "CREDIT_CARD",
    "CRYPTO",
    "DATE_TIME",
    "EMAIL_ADDRESS",
    "IP_ADDRESS",
    "PERSON",
    "PHONE_NUMBER"
]

class piiclean:
    def __init__(self):
        #self._language_set = False
        spacy.load("en_core_web_lg")
        self.analyzer = AnalyzerEngine()
        self.anomizer = AnonymizerEngine()

    def predict(self, text):
        results = self.analyzer.analyze(text=text, entities=DEFAULT_ANOYNM_ENTITIES, language="en")
        return results

    def anonymize(self, text):
        results = self.predict(text)
        result = self.anomizer.anonymize(text=text, analyzer_results=results)
        return result.text
